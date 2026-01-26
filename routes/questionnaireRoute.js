import express, { json } from 'express';
import getNewPool from '../helpers/getNewPool.js';
import verifyToken from '../middlewares/authMiddleware.js';
import { extractJsonFromAiResponse } from '../helpers/extractJsonFromAiResponse.js';
import { extractHtml } from '../helpers/extractHtml.js';
import { openai } from '../helpers/getAiClient.js';
import { getProductImageUrls } from '../helpers/getPublicImageUrl.js';




const router = express.Router();
const pool = getNewPool();

router.post('/', verifyToken, async (req, res) => {
	const userId = req.user.id;

	const body = req.body;
	const prompt = JSON.stringify(body);

	const hairType = req.body.responses.hairType;
	const hairLength = req.body.responses.hairLength;
	const scalpCondition = req.body.responses.scalpCondition;
	const currentIssues = req.body.responses.currentIssues;
	const goals = req.body.responses.goals;

	try {
		const questionnaire = await pool.query(
			`INSERT INTO questionnaire (
				user_id,
				hair_type,
				hair_length,
				scalp_condition,
				current_issues,
				goals
			) VALUES (
				$1,
				$2,
				$3,
				$4,
				$5,
				$6
			) RETURNING *`,
			[userId, hairType, hairLength, scalpCondition, currentIssues, goals]
		);

		const productsResponse = await pool.query(
			'select * from products where stock > 0'
		);

		productsResponse.rows.forEach(product => {
			product.images = getProductImageUrls(product.sku);			
		});

		const products = productsResponse.rows;


		const productStr = products
			.map((product) => {
				return {
					id: product.id,
					name: product.name,
					description: product.description
				}
			})
			.toString();

		const aiResponse = await openai.chat.completions.create({
			model: "gpt-4o-mini",
			messages: [
				{
					role: "developer", content: `
					Just return an array of ${Math.floor(Math.random() * 7)} recommended products. Always return more than one product.
					Each routine should have the shape: { id: number,  recommendation: string  }. 
					IMPORTANT: ${productStr}. Use this products in database for the name and descrption.
					The recommendation should be a little parragraph about the importance of the product itself.
					If you put this string "{{product}}", I'll replace that with the name of the product.
					`
				},
				{ role: "developer", content: `Spanish language` },
				{ role: "user", content: prompt }
			],
		});

		const jsonData = extractJsonFromAiResponse(aiResponse);
		let recommendations = jsonData
			.map((r) => {
				const product = products.find((p) => p.id === r.id);
				if (!product) return null;
				r.recommendation = r.recommendation.replace(/{{(product|producto)}}/g, product.name);
				r.recommendation = r.recommendation.replace(/{{|}}/g, '');
				return { ...product, recommendation: r.recommendation };
			})
			.filter((r) => r?.id > 0);

		if (recommendations.length === 0) {
			const selectedProducts = new Set();

			while (selectedProducts.size < 5) {
				const randomProduct = products[Math.floor(Math.random() * products.length)];
				selectedProducts.add(randomProduct);
			}

			recommendations.push(...Array.from(selectedProducts));
		}



		// general tips 
		const generalTipsResponse = await openai.chat.completions.create({
			model: "gpt-4o-mini",
			messages: [
				{ role: "developer", content: `Use this info for general recommendations and tips: ${req.body.responses.goals}` },
				{ role: "developer", content: `response consicely, in spanish,just return html format to be used with dangerouslySetInnerHTML` },
			]
		})

		const generalTips = extractHtml(generalTipsResponse.choices[0].message.content);

		res.status(200).json({ recommendations, generalTips, aiResponse });
	} catch (error) {
		console.error('Error creating questionnaire:', error);
		res.status(500).json({ message: 'Error al crear el questionario' });
	}
});

export default router;