import jwt from 'jsonwebtoken';
import getNewPool from '../helpers/getNewPool.js';

const pool = getNewPool();

const verifyToken = async (req, res, next) => {
	const token = req.header('Authorization')?.split(' ')[1];
	if (!token) return res.status(403).json({ message: 'Acceso denegado' });

	try {
		const verified = jwt.verify(token, process.env.JWT_SECRET);

		// Fetch roles from DB
		const rolesRes = await pool.query(
			'SELECT role FROM user_roles WHERE user_id = $1',
			[verified.id]
		);

		req.user = {
			...verified,
			roles: rolesRes.rows.map(r => r.role), 
		};

		next();
	} catch (error) {
		return res.status(400).json({ message: 'Token inválido', error });
	}
};

export default verifyToken;
