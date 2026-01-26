import jwt from 'jsonwebtoken';

export default function generateGuestToken() {
	const payload = { role: 'guest' };
	const secret = process.env.JWT_SECRET;
	const options = { expiresIn: '7d' }; // Example: token valid for 7 days
	return jwt.sign(payload, secret, options);
}
