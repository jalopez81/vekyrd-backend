import getNewPool from '../helpers/getNewPool.js';
import express from 'express';
import { checkRole } from '../middlewares/checkRole.js';

const pool = getNewPool();
const router = express.Router();

router.get('/',  async (req, res) => {
	 if (!req.user) {
		return res.status(200).json([]); 
	}
	
	try {
		const wishlist = await pool.query('SELECT * FROM wishlist where user_id = $1', [req.user.id]);
		res.status(200).json(wishlist.rows);
	} catch (err) {
		console.error(err.message);
		res.status(500).send(err.message);
	}
});

router.post('/:productId', checkRole('customer'), async (req, res) => {
	const { productId } = req.params;

	if (!productId) {
		return res.status(400).send({ error: true, message: 'Product ID is required' });
	}

	try {
		await pool.query(
			'INSERT INTO wishlist (user_id, product_id) VALUES ($1, $2) ON CONFLICT DO NOTHING',
			[req.user.id, productId]
		);
		res.status(201).send({ success: true, message: 'Product added to wishlist' });
	} catch (err) {
		console.error(err.message);
		res.status(500).send({ error: true, message: err.message });
	}
});

router.delete('/:productId', checkRole('customer'), async (req, res) => {
	const { productId } = req.params;

	try {
		await pool.query('DELETE FROM wishlist WHERE user_id = $1 AND product_id = $2', [req.user.id, productId]);
		res.status(200).send({ success: true, message: 'Product removed from wishlist' });
	} catch (err) {
		console.error(err.message);
		res.status(500).send({ error: true, message: err.message });
	}
});

export default router;