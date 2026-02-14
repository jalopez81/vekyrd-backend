import express from 'express';
import getNewPool from '../helpers/getNewPool.js';
import { openai } from '../helpers/getAiClient.js';
import { extractHtml } from '../helpers/extractHtml.js';
import { checkRole } from '../middlewares/checkRole.js';
import { GoogleGenAI } from '@google/genai';

const pool = getNewPool();
const router = express.Router();



const dummyCustomers = {
	"total_customers": 1200,
	"new_customers": 200,
	"total_revenue_from_customers": 25000,
	"top_customers": [
		{ "customer_id": 101, "name": "Juan Pérez", "total_spent": 5000 },
		{ "customer_id": 102, "name": "Ana Rodríguez", "total_spent": 4500 }
	],
	"average_order_value": 80
}

const dummyProducts = {
	"top_selling_products": [
		{ "id": 5, "name": "Champú Anti-Caída", "units_sold": 100, "revenue": 2000 },
		{ "id": 10, "name": "Acondicionador Nutritivo", "units_sold": 80, "revenue": 1600 }
	],
	"slow_moving_products": [
		{ "id": 15, "name": "Gel Fijador", "units_sold": 10, "revenue": 100 },
		{ "id": 18, "name": "Shampoo para Niños", "units_sold": 15, "revenue": 150 }
	],
	"total_sales": 15000
}

const getSalesData = async ({ start_date, end_date }) => {
	const salesData = await pool.query(
		`
		SELECT
		o.id AS order_id, 
		o.created_at,
		o.user_id,
		o.payment_method,
		o.order_hash,
		c.product_id,
		c.quantity,
		p.name,
		p.price,
		p.category
		FROM orders o
		JOIN cart c ON c.order_id = o.id
		JOIN products p ON p.id = c.product_id
		WHERE o.created_at >= $1 AND o.created_at <= $2
		`,
		[start_date.toString(), end_date.toString()]
	);



	return {
		salesData: salesData.rows,
	};
}

const getTopSellingProducts = async (body) => {
	const { date_start, date_end, amount_records } = body;
	const topSellingProducts = await pool.query(`
		SELECT 
				p.name AS product_name,
				p.category AS category,
				TO_CHAR(c.created_at, 'YYYY-MM-DD') AS date, 
				SUM(c.quantity) AS quantity_sold,
				SUM(c.quantity * p.price) AS revenue, 
				(SUM(c.quantity * p.price) / 
						(SELECT SUM(c2.quantity * p2.price) 
						FROM cart c2 
						JOIN products p2 ON p2.id = c2.product_id 
						WHERE c2.created_at >= $1 AND c2.created_at <= $2)
				) * 100 AS sales_percentage
		FROM cart c
		JOIN products p ON p.id = c.product_id
		WHERE c.created_at >= $1 AND c.created_at <= $2
		GROUP BY p.name, p.category, TO_CHAR(c.created_at, 'YYYY-MM-DD')
		ORDER BY quantity_sold DESC
		LIMIT $3;
		`, [date_start, date_end, amount_records]);

	return topSellingProducts.rows;
}

const getInventoryData = async () => {
	const inventoryData = await pool.query(`
		SELECT id, name, sku, price, category, stock 
		FROM products
		`	);

	return inventoryData.rows
}


const getCustomerData = () => dummyCustomers
const getProductData = () => dummyProducts

//sales
router.get('/sales', checkRole('admin'), async (req, res) => {
	const { start_date, end_date } = req.query;

	try {
		const salesData = await getSalesData({ start_date, end_date });
		res.json(salesData);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching sales data', error: err });
	}
});

router.post('/top-selling', checkRole('admin'), async (req, res) => {

	try {
		const data = await getTopSellingProducts(req.body);
		res.json(data);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching top selling products', error: err });
	}
});

// orders
router.get('/pending-orders', checkRole('admin'), async (req, res) => {
	const { date_start, date_end } = req.query;
	console.log({ date_start, date_end });
	try {
		const pendingOrders = await pool.query(`
			select 
			o.id, 
			o.user_id, 
			u.username, 
			u.email, 
			o.total_price, 
			o.created_at, 
			o.status 
		from 
			orders o 
			join users u on u.id = o.user_id 
		where 
			o.status = 'pending' and
			o.created_at >= $1 AND o.created_at <= $2
		`, [date_start, date_end]);

		res.json(pendingOrders.rows);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching pending orders', error: err });
	}
});

//inventory
router.get('/inventory', checkRole('admin'), async (req, res) => {
	try {
		const inventoryData = await getInventoryData();
		res.json(inventoryData);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching inventory data', error: err });
	}
});

router.get('/inventory_history', checkRole('admin'), async (req, res) => {
	try {
		const response = await pool.query(`
			select  ih.id id,  date, operation_type, quantity, p.name, p.category from inventory_history ih
			join products p on p.id = product_id
			`);

		const data = response.rows;
		res.json(data);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching inventory data', error: err });
	}
});

//customers
router.get('/customers', async (req, res) => {
	const { start_date, end_date, group_by } = req.query;

	try {
		const customerData = await getCustomerData(start_date, end_date, group_by);
		res.json(customerData);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching customer data', error: err });
	}
});


//products
router.get('/products', async (req, res) => {
	const { start_date, end_date, group_by } = req.query;

	try {
		const productData = await getProductData(start_date, end_date, group_by);
		res.json(productData);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching product data', error: err });
	}
});

router.post('/categories-analysis', async (req, res) => {
	const body = req.body;
	const data = JSON.stringify(body);

	const ai = new GoogleGenAI({});

	try {
		const geminiResponse = await ai.models.generateContent({
			model: process.env.GEMINI_MODEL,
			contents: [
				{ role: "developer", text: `response consicely, in spanish,just return html format to be used with dangerouslySetInnerHTML` },
				{ role: "developer", text: `What's your analysis of this sales report?${data}` }
			]
		});

		const content = geminiResponse.text;

		const html = extractHtml(content);

		res.status(200).json(html);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching categories analysis', error: err });
	}
});

// users 
router.post('/users', async (req, res) => {
	const { date_start, date_end } = req.body;
	const usersData = {};
	try {
		const allUsers = await pool.query(`select * from users`)
		usersData.allUsers = allUsers.rows;

		const logins = await pool.query(`
			SELECT
			user_id,
			u.username, 
			u.email,
			u.active,
			COUNT(user_id) AS logins
			FROM login_history
			JOIN users u on u.id = user_id
			WHERE login_time >= $1 AND login_time <= $2
			GROUP BY user_id, u.username, u.email, u.active
		`, [date_start, date_end])
		usersData.logins = logins.rows;


		res.json(usersData);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching user data', error: err });
	}
});

// reviews 
router.get('/reviews', async (req, res) => {

	try {
		const allReviews = await pool.query(`
			SELECT 
				product_id,
				p.name,
				sku,
				category,
				average_rating,
				COUNT(comment) AS reviews,
				COUNT(CASE WHEN rating >= 4 THEN 1 END) AS positivo,
				COUNT(CASE WHEN rating = 3  THEN 1 END) AS neutral,
				COUNT(CASE WHEN rating <= 2 THEN 1 END) AS negativo
		FROM 
				product_reviews
		JOIN 
				products p ON p.id = product_id
		GROUP BY 
				product_id,
				p.name,
				sku,
				category,
				average_rating
		ORDER BY 
				reviews DESC;

		`)
		res.json(allReviews.rows);
	} catch (err) {
		res.status(500).json({ message: 'Error fetching reviews', error: err });
	}
});

export default router;