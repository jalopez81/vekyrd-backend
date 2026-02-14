import express from 'express';
import getNewPool from '../helpers/getNewPool.js';
import { getProductImageUrls } from '../helpers/getPublicImageUrl.js';
import verifyToken from '../middlewares/authMiddleware.js';

import { GoogleGenAI } from "@google/genai";
import { extractHtml } from '../helpers/extractHtml.js';
import { extractJsonFromAiResponse } from '../helpers/extractJsonFromAiResponse.js'

const ai = new GoogleGenAI({});


const router = express.Router();
const pool = getNewPool();

router.post('/', verifyToken, async (req, res) => {
	const hairType = req.body.responses.hairType;
	const hairLength = req.body.responses.hairLength;
	const scalpCondition = req.body.responses.scalpCondition;
	const currentIssues = req.body.responses.currentIssues;
	const goals = req.body.responses.goals;

	const formData = [hairType, hairLength, scalpCondition, currentIssues, goals];
	const language = req.body.responses.language

	try {
		const productsResponse = await pool.query(
			'select * from products where stock > 0'
		);

		productsResponse.rows.forEach(product => {
			product.images = getProductImageUrls(product.sku);
		});

		const productsRows = productsResponse.rows;

		const products = JSON.stringify(productsRows
			.map((product) => {
				return {
					id: product.id,
					name: product.name,
					description: product.description
				}
			})
		)


		const geminiResponse = await ai.models.generateContent({
			model: process.env.GEMINI_MODEL,
			contents: [{
				parts: [{
					text: `
					Developer instructions: Just return an array of ${Math.floor(Math.random() * 7)} recommended products. Always return more than one product.
					Each routine should have the shape: { id: number,  recommendation: string  }. 
					IMPORTANT: ${products}. Use this products in database for the name and descrption.
					The recommendation should be a little parragraph about the importance of the product itself.
					If you put this string "{{product}}", I'll replace that with the name of the product.
					User: ${formData}
					Reply in this language: ${language}
					`}]
			}],
			config: {responseModalities: ['TEXT']}
		})


		console.log(geminiResponse.text);
		const arrRecommendations = extractJsonFromAiResponse(geminiResponse.text);
		let recommendations = arrRecommendations
			.map((r) => {
				const product = productsRows.find((p) => p.id === r.id);
				if (!product) return null;
				r.recommendation = r.recommendation.replace(/{{(product|producto)}}/g, product.name);
				r.recommendation = r.recommendation.replace(/{{|}}/g, '');
				return { ...product, recommendation: r.recommendation };
			})
			.filter((r) => r?.id > 0);

		if (recommendations.length === 0) {
			const selectedProducts = new Set();

			while (selectedProducts.size < 5) {
				const randomProduct = productsRows[Math.floor(Math.random() * productsRows.length)];
				selectedProducts.add(randomProduct);
			}

			recommendations.push(...Array.from(selectedProducts));
		}

		const generalTipsResponse = await ai.models.generateContent({
			model: process.env.GEMINI_MODEL,
			contents: [{
				parts: [{
					text: `
					Developer instructions: Use this info for general recommendations and tips: ${formData}.
					Respond concisely, just return html format to be used with dangerouslySetInnerHTML.
					Reply in this language: ${language}
					`
				}]
			}],
			config: {responseModalities: ['TEXT']}
		});

		const generalTips = extractHtml(generalTipsResponse.text);

		res.status(200).json({ recommendations, generalTips, geminiResponse });
	} catch (error) {
		console.error('Error creating questionnaire:', error);
		res.status(500).json({ message: 'Error al crear el questionario' });
	}

});

export default router;