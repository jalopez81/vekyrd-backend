import express from 'express';
import getNewPool from '../helpers/getNewPool.js';
import verifyToken from '../middlewares/authMiddleware.js';

const pool = getNewPool();
const router = express.Router();

router.post('/', verifyToken, async (req, res) => {
	const { productId, rating, comment } = req.body;
	const userId = req.user.id;

	if (!productId || !rating) {
		return res.status(400).json({ message: "Product ID and rating are required" });
	}

	try {
		const result = await pool.query(
			`INSERT INTO product_reviews (user_id, product_id, rating, comment) 
            VALUES ($1, $2, $3, $4) RETURNING *`,
			[userId, productId, rating, comment]
		);

		await updateAverageRating(productId);

		res.status(201).json(result.rows[0]);
	} catch (error) {
		console.error('Error adding review:', error);
		res.status(500).json({ message: 'Error adding review' });
	}
});

router.get('/:productId', async (req, res) => {
	const { productId } = req.params;

	try {
		const result = await pool.query(
			`SELECT r.id, r.rating, r.comment, r.created_at, u.username
					FROM product_reviews r
					JOIN users u ON r.user_id = u.id
					WHERE r.product_id = $1`,
			[productId]
		);

		res.status(200).json(result.rows);
	} catch (error) {
		console.error('Error fetching reviews:', error);
		res.status(500).json({ message: 'Error fetching reviews' });
	}
});


const updateAverageRating = async (productId) => {
	const result = await pool.query(
		`SELECT AVG(rating) as average_rating FROM product_reviews WHERE product_id = $1`,
		[productId]
	);
	const averageRating = result.rows[0].average_rating || 0;

	await pool.query(
		`UPDATE products SET average_rating = $1 WHERE id = $2`,
		[averageRating, productId]
	);
};

export default router;
