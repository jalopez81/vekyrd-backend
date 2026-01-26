import getErrorHtml from '../helpers/getErrorHtml.js';
import getNewPool from '../helpers/getNewPool.js';
import express from 'express';

const router = express.Router();
const pool = getNewPool();

router.post('/', async (req, res) => {
	const { name, email, message } = req.body;

	try {
		const newContact = await pool.query(
			'INSERT INTO contactus (name, email, message) VALUES ($1, $2, $3) RETURNING *',
			[name, email, message]
		);

		res.status(201).json(newContact.rows[0]);
	} catch (error) {
		console.error(error);
		res.status(500).send(getErrorHtml(500, error.message));
	}
});

router.get('/', async (req, res) => {
	try {
		const contacts = await pool.query('SELECT * FROM contactus');
		res.status(200).json(contacts.rows);
	} catch (err) {
		console.error(err.message);
		res.status(500).send(getErrorHtml(500, err.message));
	}
});

/*
export const apiSetCommentAsRead = async (commentId) => {
	try {
		const response = await api.put(
			`http://localhost:5000/comments/${commentId}`,
			{
				read: true,
			}
		);
		return response.data;
	} catch (error) {
		console.error('Error setting comment as read:', error);
	}
};
 */

router.put('/:commentId', async (req, res) => {
	const { commentId } = req.params;
	const { read } = req.body;

	try {
		await pool.query('UPDATE contactus SET read = $1 WHERE id = $2', [read, commentId]);
		res.status(200).send({ success: true, message: 'Comment marked as read' });
	} catch (err) {
		console.error(err.message);
		res.status(500).send({ error: true, message: err.message });
	}
});

router.delete('/:commentId', async (req, res) => {
	const { commentId } = req.params;

	try {
		await pool.query('DELETE FROM contactus WHERE id = $1', [commentId]);
		res.status(200).send({ success: true, message: 'Comment deleted' });
	} catch (err) {
		console.error(err.message);
		res.status(500).send({ error: true, message: err.message });
	}
});

export default router;