import getErrorHtml from '../helpers/getErrorHtml.js';
import getNewPool from '../helpers/getNewPool.js';
import express from 'express';
import { checkRole } from '../middlewares/checkRole.js';
import multer from 'multer';
import { getProductImageUrls } from '../helpers/getPublicImageUrl.js';

const storage = multer.diskStorage({
	destination: (_, file, cb) => {
		console.log('destination: ', file);
		cb(null, './img/products/');
	},
	filename: (_, file, cb) => {
		cb(null, `${Date.now().toString().substring(0, 6)}_${file.originalname}`);
	},
});

const upload = multer({ storage: storage });


const pool = getNewPool();
const router = express.Router();

router.get('/', async (_, res) => {
	try {
		const products = await pool.query(`
			SELECT * FROM products 
			WHERE stock > 0
		`);

		products.rows.forEach(product => {
			product.images = getProductImageUrls(product.sku);			
		});

		res.status(200).json(products.rows);
	} catch (err) {
		console.error(err.message);
		res.status(500).send(getErrorHtml(500, err.message));
	}
});

router.post('/add-new-product/images', upload.fields([
	{ name: 'image1', maxCount: 1 },
	{ name: 'image2', maxCount: 1 },
	{ name: 'image3', maxCount: 1 },
]), (req, res) => {
	try {
		//req.files.image1 ? `/img/products/${req.files.image1[0].filename}` : null,
		const imageUrls = [];
		Object.keys(req.files).forEach(key => {
			if (req.files[key]) {
				const file = req.files[key][0];
				imageUrls.push(`/img/products/${file.filename}`);
			}
		});

		res.status(200).send({
			image1Url: imageUrls[0],
			image2Url: imageUrls[1],
			image3Url: imageUrls[2],
		});
	} catch (error) {
		console.error('Error uploading images:', error);
		res.status(500).send('Server error');
	}
});

router.put('/changeActiveStatus/:productId', checkRole('admin'), async (req, res) => {
	try {
		const { productId } = req.params;
		const { newStatus } = req.query;		
		await pool.query(`
			update products 
			set active = $1
			WHERE id = $2
			`, [newStatus, productId]); await
			res.status(200).json({ message: `Product status changed to active=${newStatus} successfully` });
	} catch (err) {
		console.error(err.message);
		res.status(500).send(getErrorHtml(500, err.message));
	}
});


router.post('/add-new-product', async (req, res) => {

	const { name, sku, category, description, description_large, price, stock, average_rating } = req.body;

	try {
		const newProduct = await pool.query(
			'INSERT INTO products (name, sku, category, description, description_large, price, stock, average_rating) VALUES ($1, $2, $3, $4, $5, $6, $7, $8 ) RETURNING *',
			[name, sku, category, description, description_large, price, stock, average_rating]
		);

		res.status(201).json(newProduct.rows[0]);
	} catch (error) {
		console.error(error);
		res.status(500).send(getErrorHtml(500, error.message));
	}
});
router.get('/inventory', checkRole('admin'), async (req, res) => {
	try {
		const inventory = await pool.query('SELECT * FROM products');
		res.status(200).json(inventory.rows);
	} catch (err) {
		console.error(err.message);
		res.status(500).send(getErrorHtml(500, err.message));
	}
});



// ** parametized queries ** 

router.get('/:productId', async (req, res) => {
	try {
		const result = await pool.query('SELECT * FROM products where id = $1', [req.params.productId]);

		result.rows.forEach(product => {
			product.images = getProductImageUrls(product.sku);			
		});

		res.status(200).json(result.rows[0]);
	} catch (err) {
		console.error(err.message);
		res.status(500).send(getErrorHtml(500, err.message));
	}
});

// updateproductInventory
router.put('/updateInventory/', async (req, res) => {
	const { productId, stock, price } = req.body;

	try {
		// update inventory and return the updated product
		await pool.query('UPDATE products SET stock = $1, price = $2 WHERE id = $3', [stock, price, productId]);
		await pool.query(`
				insert into inventory_history
				(operation_type, quantity, product_id, date)
				values
				('actualizacion', $1, $2, now())
			`, [stock, productId])
		const result = await pool.query(`select * from products where id = $1`, [productId]);
		res.status(200).json(result.rows[0]);
	} catch (err) {
		console.log(err.message)

	}
})

export default router;
