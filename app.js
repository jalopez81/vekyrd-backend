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

console.clear();

const pool = getNewPool();

(async () => {
  try {
    const res = await pool.query('SELECT NOW(), current_database()');
    console.log(chalk.cyan('---------------------------------------'));
    console.log(chalk.green('✅ Base de Datos Operativa'));
    console.log(chalk.white(`   Hora BD: ${res.rows[0].now}`));
    console.log(chalk.white(`   Nombre BD: ${res.rows[0].current_database}`));
    console.log(chalk.cyan('---------------------------------------'));
  } catch (err) {
    console.error(chalk.red('❌ Error crítico de conexión:'), err.stack);
  }
})();

const checkTables = async () => {
  try {
    const res = await pool.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public'
    `);
    console.log(chalk.magenta('🔍 Tablas encontradas por Node:'), res.rows.map(t => t.table_name));
  } catch (err) {
    console.error('Error al listar tablas:', err.message);
  }
};
checkTables();

// Agrega esto justo después de conectar el pool
const dbInfo = await pool.query("SELECT current_database(), current_schema(), session_user");
console.log('--- Info de Conexión ---');
console.table(dbInfo.rows);

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

app.get('/api/health', async (_, res) => {
  try {
    // Ejecutamos una consulta ultra rápida
    await pool.query('SELECT 1'); 
    res.status(200).json({
      status: 'OK',
      database: 'Connected',
      timestamp: new Date()
    });
  } catch (err) {
    res.status(500).json({
      status: 'Error',
      database: 'Disconnected',
      error: err.message
    });
  }
});

app.use('/api/saludar', (_, res) => {
	res.status(200).send({
		type: "cat",
		name: 'minino',
		color: 'green'
	});
});



app.listen(port, () => console.log(`${chalk.green('===> Server running on')} ${chalk.yellow('http://localhost:', port, '...')}`));
