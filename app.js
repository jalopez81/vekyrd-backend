import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import productsRoute from './routes/productsRoute.js';
import cartRoute from './routes/cartRoute.js';
import authRoute from './routes/authRoute.js';
import ordersRoute from './routes/ordersRoute.js';
import usersRoute from './routes/usersRoute.js';
import questionnaireRoute from './routes/questionnaireRoute.js';
import contactusRoute from './routes/contactusRoute.js'
import reportsRoute from './routes/reportsRoute.js';
import wishlistRoute from './routes/wishlistRoute.js';
import reviewsRoute from './routes/reviewRoute.js';
import imagesRoute from './routes/imagesRoute.js';
import logEndpointCalls from './middlewares/logEndpointCalls.js';
import chalk from 'chalk';
import getNewPool from './helpers/getNewPool.js';
dotenv.config();

const pool = getNewPool();

pool.query('SELECT NOW()')
  .then(result => {
    console.log('✅ DB Connected:', result.rows[0]);
  })
  .catch(err => {
	console.log('ENV:', process.env.NODE_ENV);
	console.log('DB HOST:', process.env.DB_HOST);
	console.log('PROD URL:', process.env.PROD_DATABASE_URL);
    console.error('❌ DB Connection Error:', err.message);
  });




const app = express();
const port = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use(logEndpointCalls())

app.use('/api/auth', authRoute);
app.use('/api/cart', cartRoute);
app.use('/api/contactus', contactusRoute);
app.use('/api/orders', ordersRoute);
app.use('/api/products', productsRoute);
app.use('/api/questionnaire', questionnaireRoute);
app.use('/api/reports', reportsRoute);
app.use('/api/reviews', reviewsRoute);
app.use('/api/users', usersRoute);
app.use('/api/wishlist', wishlistRoute);
app.use('/api/images', imagesRoute);

app.use('/api/saludar', (req, res) => {
	res.status(200).send({
		type: "cat",
		name: 'minino',
		color: 'green'
	});
});



app.listen(port, () => console.log(`${chalk.green('===> Server running on')} ${chalk.yellow('http://localhost:', port, '...')}`));
