import getErrorHtml from '../helpers/getErrorHtml.js';
import getNewPool from '../helpers/getNewPool.js';
import express from 'express';
import verifyToken from '../middlewares/authMiddleware.js';

const router = express.Router();
const pool = getNewPool();

//Add 
router.post('/add', verifyToken, async (req, res) => {
	const { product_id, quantity } = req.body;
	const user_id = req.user.id;
	try {
		const result = await pool.query(
			'INSERT INTO cart (product_id, quantity, user_id) VALUES ($1, $2, $3) RETURNING *',
			[product_id, quantity, user_id]
		);
		res.status(201).json(result.rows[0]);
	} catch (err) {
		console.error(err.message);
		res.status(500).send(getErrorHtml(500, err.message));
	}
});

//Get 
router.get('/', verifyToken, async (req, res) => {
	const user_id = req.user.id;


	try {
		// Obtener el carrito del usuario
		const cart = await pool.query(

			`SELECT c.id, c.quantity, p.name, p.price, p.stock, product_id
			FROM cart c 
			JOIN products p ON c.product_id = p.id 
			WHERE c.user_id = $1`,
			[user_id]
		);

		// Verificar disponibilidad de productos
		const validatedCart = cart.rows.map(item => {
			if (item.quantity > item.stock) {
				item.available = false;
			} else {
				item.available = true;
			}
			return item;
		});

		res.json(validatedCart);
	} catch (error) {
		console.error('Error fetching cart:', error);
		res.status(500).json({ message: 'Error al obtener el carrito' });
	}
});

router.get('/:orderHash', async (req, res) => {
	const { orderHash } = req.params;
	try {
		const cart = await pool.query(
			`SELECT 
			c.id, 
			c.quantity, 
			p.average_rating, 
			p.description, 
			p.imageUrl1, 
			p.name, 
			p.price, 
			p.stock, product_id
			FROM cart c 
			JOIN products p ON c.product_id = p.id 
			WHERE c.order_hash = $1`,
			[orderHash]
		);

		// Verificar disponibilidad de productos
		const validatedCart = cart.rows.map(item => {
			if (item.quantity > item.stock) {
				item.available = false;
			} else {
				item.available = true;
			}
			return item;
		});

		res.json(validatedCart);
	} catch (error) {
		console.error('Error fetching cart:', error);
		res.status(500).json({ message: 'Error al obtener el carrito' });
	}
});

//Remove
router.delete('/remove/:id', async (req, res) => {
	const { id } = req.params;
	try {
		await pool.query('DELETE FROM cart WHERE product_id = $1', [id]);
		res.status(200).json({ message: 'Producto eliminado' });
	} catch (err) {
		console.error(err.message);
		res.status(500).send('Server error');
	}
});

// Cart clear
router.delete('/clear', verifyToken, async (req, res) => {
	const user_id = req.user.id;

	try {
		await pool.query('DELETE FROM cart WHERE user_id = $1', [user_id]);
		res.status(200).json({ message: 'Carrito borrado' });
	} catch (err) {
		console.error(err.message);
		res.status(500).send('Server error');
	}
});

export default router;
