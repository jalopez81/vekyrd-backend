import getErrorHtml from '../helpers/getErrorHtml.js';
import getNewPool from '../helpers/getNewPool.js';
import express from 'express';
import verifyToken from '../middlewares/authMiddleware.js';
import { randomHashGenerator } from '../helpers/randomHashGenerator.js';
import { simulatePayment } from '../helpers/simulatePayment.js';
import { checkRole } from '../middlewares/checkRole.js';

const router = express.Router();
const pool = getNewPool();

router.post('/createOrder', verifyToken, async (req, res) => {
	const userId = req.user.id;
	try {
		// Check if the user already has a pending order
		const existingOrder = await pool.query(
			'DELETE  FROM orders WHERE user_id = $1 AND status = $2 RETURNING *',
			[userId, 'pending']
		);

		// If no pending order exists, create a new order
		const confirmationHash = randomHashGenerator();
		const orderHash = randomHashGenerator();
		const orderDetails = req.body.orderDetails;
		const { subtotal = 0, taxes = 0, shipping = 0, total = 0 } = orderDetails;
		const order = await pool.query(
			`INSERT INTO orders (
				confirmation_number,
				created_at,
				order_hash,
				status,
				subtotal,
				taxes,
				shipping,
				total_price,
				user_id, 
				payment_method
			) VALUES (
			 	$1,
				NOW(),
				$2,
				'pending',
				$3,
				$4,
				$5,
				$6,	
				$7,
				'credit_card'
			) 
			 RETURNING *`,
			[
				/*$1*/ confirmationHash,
				/*$2*/ orderHash,
				/*$3*/ subtotal,
				/*$4*/ taxes,
				/*$5*/ shipping,
				/*$6*/ total,
				/*$7*/ userId]
		);

		const cart = req.body.cart;
		cart.forEach(async (item) => {
			const { id, quantity, price } = item;
			await pool.query(
				'INSERT INTO cart (product_id, quantity, price, user_id, order_hash, order_id) VALUES ($1, $2, $3, $4, $5, $6) RETURNING * ',
				[id, quantity, parseFloat(price), userId, orderHash, order.rows[0].id]
			);
		});

		res.json(order.rows[0]);
	} catch (error) {
		console.error('Error creating order: ', error);
		res.status(500).json({ message: 'Error al crear el pedido', error });
	}
});

router.post('/updatecart', verifyToken, async (req, res) => {
	const items = req.body;
	const userId = req.user.id;

	try {
		await pool.query('DELETE FROM cart WHERE user_id = $1', [userId]);

		for (const item of items) {
			await pool.query(
				`INSERT INTO cart (product_id, quantity, user_id) VALUES ($1, $2, $3)`,
				[item.product_id, item.quantity, userId]
			);
		}

		const summary = await getOrderSummary(userId, pool);
		res.status(200).json(summary);
	} catch (error) {
		console.error('Error updating cart:', error);
		res.status(500).send(getErrorHtml(500, error.message));
	}
});

router.get('/userOrders', checkRole(['customer', 'admin', 'moderator']), async (req, res) => {
	const userId = req.user.id;
	try {
		const result = await pool.query(`
			SELECT id,
       status,
       total_price,
       created_at,
       confirmation_number,
       order_hash,
       subtotal,
       shipping,
       taxes,
       payment_method
			FROM   orders
			WHERE  user_id = $1
		`, [userId]);
		res.status(200).json(result.rows);
	} catch (error) {
		res.status(500).json({ message: 'Error retrieving orders', error: error.message });
	}
});

// order/payment
router.post('/payment', verifyToken, async (req, res) => {
	const userId = req.user.id;
	const { orderHash, paymentDetails, cart, total, subtotal, taxes, shipping } = req.body;

	// Validate incoming data
	if (!orderHash || !paymentDetails) {
		return res.status(400).json({ message: "order_hash and payment details are required" });
	}

	try {
		// Simulate payment processing
		const paymentSuccess = await simulatePayment(paymentDetails);

		if (!paymentSuccess) {
			return res.status(400).json({ message: "Payment failed. Please check your card details." });
		}

		// Update order status to 'paid'
		const paymentResult = await pool.query(
			`UPDATE orders SET 
			status = 'paid',
			created_at = NOW(),
			total_price = $1,
			subtotal = $2,
			taxes = $3,
			shipping = $4
			WHERE order_hash = $5 RETURNING *`,
			[total, subtotal, taxes, shipping, orderHash]
		);

		// save order items
		for (const item of cart) {
			await pool.query(
				`INSERT INTO order_items (order_id, product_id, quantity, price) VALUES ($1, $2, $3, $4)`,
				[paymentResult.rows[0].id, item.productId, item.quantity, item.price]
			);
		}

		const orderItems = await pool.query(
			`SELECT product_id, quantity FROM order_items WHERE order_id = $1`,
			[paymentResult.rows[0].id]
		);

		// Update stock 
		for (const item of orderItems.rows) {
			await pool.query(
				`UPDATE products SET stock = stock - $1 WHERE id = $2 AND stock >= $1`,
				[item.quantity, item.product_id]
			);

			await pool.query(`
				insert into inventory_history
				(operation_type, product_id, quantity, date)
				values
				('salida', $1, $2, now())
				`, [item.product_id, item.quantity])
		}

		// Save cart
		for (const item of cart) {
			const total_price = parseFloat(item.price) * parseFloat(item.quantity);
			await pool.query(
				`INSERT INTO cart 
				(product_id, quantity, price, user_id, order_id, order_hash)
				VALUES 
				($1, $2, $3, $4, $5, $6)`,
				[item.productId, item.quantity, item.price, userId, paymentResult.rows[0].id, orderHash]

			);
		}


		// Respond with confirmation
		res.status(200).json({
			status: "success",
			message: "Payment successful. Order confirmed.",
			orderId: orderHash,
			paymentDate: new Date(),
			confirmationHash: paymentResult.rows[0].confirmation_number,
		});
	} catch (error) {
		console.error("Error processing payment:", error);
		res.status(500).json({ message: "Server error. Please try again later." });
	}
});
;

export default router;
