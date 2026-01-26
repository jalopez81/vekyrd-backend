import getErrorHtml from '../helpers/getErrorHtml.js';
import getNewPool from '../helpers/getNewPool.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { randomHashGenerator } from '../helpers/randomHashGenerator.js';

const pool = getNewPool();

const register = async (req, res) => {
	const { username, email, password } = req.body;


	try {
		console.log('start...')
		const userExists = await pool.query(
			'SELECT * FROM users WHERE email = $1 OR username = $2',
			[email, username]
		);
		if (userExists.rows.length > 0) {
			return res.status(400).json({ message: 'Usuario o correo ya existe' });
		}

		const hashedPassword = await bcrypt.hash(password, 10);

		const newUser = await pool.query(
			'INSERT INTO users (username, email, password) VALUES ($1, $2, $3) RETURNING id, username, email',
			[username, email, hashedPassword]
		);

		// assign default role
		await pool.query('INSERT INTO user_roles (user_id, role) VALUES ($1, $2)', [newUser.rows[0].id, 'customer']);

		return res.status(201).json({ message: 'Usuario registrado exitosamente', user: newUser.rows[0] });
	} catch (error) {
		console.error(error);
		return res.status(500).send(getErrorHtml(500, error.message));
	}
};

const login = async (req, res) => {
	const { username, password } = req.body;

	try {
		const user = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
		if (user.rows.length === 0) {
			return res.status(400).json({ message: 'Usuario no encontrado' });
		}

		const isMatch = await bcrypt.compare(password, user.rows[0].password);
		if (!isMatch) {
			return res.status(400).json({ message: 'Contraseña incorrecta' });
		}

		// get role 
		const rolesResponse = await pool.query('SELECT * FROM user_roles where user_id = $1', [user.rows[0].id]);
		const roles = rolesResponse.rows.map(role => role.role);

		// post to login_history
		const newSessionId = randomHashGenerator();
		await pool.query(
			'INSERT INTO login_history (user_id, session_id) VALUES ($1, $2) RETURNING *',
			[user.rows[0].id, newSessionId]
		);

		// sign tokens 
		const token = jwt.sign(
			{ id: user.rows[0].id, username: user.rows[0].username, roles, session_id: newSessionId },
			process.env.JWT_SECRET,
			{ expiresIn: '1d' }
		);
		const refreshToken = jwt.sign(
			{ id: user.rows[0].id, username: user.rows[0].username },
			process.env.JWT_SECRET_REFRESH,
			{ expiresIn: '7d' }
		);

		// user basic info 
		const userBasicInfo = {
			id: user.rows[0].id,
			username: user.rows[0].username,
			email: user.rows[0].email,
			phone_number: user.rows[0].phone_number,
			address: user.rows[0].address,
			first_name: user.rows[0].first_name,
			last_name: user.rows[0].last_name,
			roles: roles,
		}

		return res.status(200).json({ status: 200, message: 'Login exitoso', token, refreshToken, user: userBasicInfo });
	} catch (error) {
		console.error(error);
		return res.status(500).send(getErrorHtml(500, error.message));
	}
};

const refreshToken = async (req, res) => {
	const { refreshToken } = req.body;

	try {
		const payload = jwt.verify(refreshToken, process.env.JWT_SECRET_REFRESH);
		const newToken = jwt.sign({ id: payload.id, username: payload.username }, process.env.JWT_SECRET, { expiresIn: '1h' });
		res.status(200).json({ token: newToken });
	} catch (err) {
		res.status(401).json({ message: 'Invalid refresh token' });
	}
};

export const logout = async (req, res) => {
	const session_id = req.user.session_id;
	try {
		await pool.query(
			'UPDATE login_history SET logout_time = now() WHERE session_id = $1',
			[session_id]
		);
		res.status(200).json({ message: 'Sesión cerrada' });
	} catch (error) {
		console.error(error);
		res.status(500).send(getErrorHtml(500, error.message));
	}
};

export { register, login, refreshToken };
