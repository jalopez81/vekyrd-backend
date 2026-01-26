import getErrorHtml from '../helpers/getErrorHtml.js';
import getNewPool from '../helpers/getNewPool.js';
import express from 'express';
import { checkRole } from '../middlewares/checkRole.js';
import verifyToken from '../middlewares/authMiddleware.js';

const pool = getNewPool();
const router = express.Router();

// user s
router.get('/', async (req, res) => {
	try {
		const result = await pool.query('SELECT * FROM users');
		res.status(200).json(result.rows);
	} catch (error) {
		console.error('Error fetching users:', error);
		res.status(500).send(getErrorHtml(error));
	}
});

router.get('/currentUser', verifyToken, checkRole(['customer', 'admin', 'moderator']), async (req, res) => {
	const userId = req.user.id;

	try {
		const result = await pool.query(`
			SELECT 
				users.id, 
				username, 
				email, 
				active, 
				first_name, 
				last_name, 
				phone_number,
				address 
			FROM users 
			WHERE users.id = $1
		`, [userId]);
		res.status(200).json(result.rows[0]);
	} catch (error) {
		console.error('Error fetching user:', error);
		res.status(500).send(getErrorHtml(error));
	}
});

router.put('/updateUserProfile', verifyToken, checkRole(['customer', 'admin', 'moderator']), async (req, res) => {
	const userId = req.user.id;
	const {
		first_name,
		last_name,
		phone_number,
		address,
	} = req.body.updateData;

	try {
		await pool.query(`
			UPDATE users 
			SET 
				first_name = $1, 
				last_name = $2, 				
				phone_number = $3, 
				address = $4
				where id = $5
		`, [first_name, last_name, phone_number, address, userId]);
		
		res.status(200).send({ message: 'El perfil de usuario ha sido actualizado' });
	} catch (error) {
		console.error('Error updating user profile:', error);
		res.status(500).send(getErrorHtml(error));
	}
});

router.get('/getCreditCard', verifyToken, checkRole(['customer', 'admin', 'moderator']), async (req, res) => {
	const userId = req.user.id;
	const encryptionKey = process.env.POSTGRESS_ENCRYPTION_KEY;

	if(!req.user){
		res.status(200);
	}

	try {
		const result = await pool.query(`
			SELECT 
				cardholder_name,
				pgp_sym_decrypt(card_number::bytea, $2) as card_number,
				cvv,
				expiration_date,
				billing_address
			FROM credit_cards 			
			WHERE user_id = $1
		`, [userId, encryptionKey]);
		res.status(200).json(result.rows[0]);
	} catch (error) {
		console.error('Error fetching user:', error);
		res.status(500).send(getErrorHtml(error));
	}
});

router.post('/createCreditCard', verifyToken, checkRole(['customer', 'admin', 'moderator']), async (req, res) => {
    const userId = req.user.id;
    const encryptionKey = process.env.POSTGRESS_ENCRYPTION_KEY;

    try {
        const { card_number, cvv, expiration_date, cardholder_name, billing_address } = req.body;
        const parsedExpirationDate = new Date(expiration_date).toISOString(); // "2026-06-01T00:00:00.000Z"

        await pool.query(`
            INSERT INTO credit_cards (user_id, card_number, cvv, expiration_date, cardholder_name, billing_address)
            VALUES ($1, pgp_sym_encrypt($2, $3), $4, $5, $6, $7)
            ON CONFLICT (user_id) 
            DO UPDATE SET 
                card_number = pgp_sym_encrypt($2, $3)::bytea,
                cvv = $4,
                expiration_date = $5,
                cardholder_name = $6,
				billing_address = $7
        `, [userId, card_number, encryptionKey, cvv, parsedExpirationDate, cardholder_name, billing_address]);

        res.status(200).send({ message: 'La tarjeta de crédito ha sido guardada o actualizada' });
    } catch (error) {
        console.error('Error saving credit card:', error);
        res.status(500).send(getErrorHtml(error));
    }
});

router.delete('/removeCreditCard', verifyToken, checkRole(['customer', 'admin', 'moderator']), async (req, res) => {
    const userId = req.user.id;
    try {
        await pool.query(`
            DELETE FROM credit_cards 
            WHERE user_id = $1
        `, [userId]);
        res.status(200).send({ message: 'La tarjeta de crédito ha sido eliminada' });
    } catch (error) {
        console.error('Error deleting credit card:', error);
        res.status(500).send(getErrorHtml(error));
    }
});



// roles 
router.get('/roles', verifyToken, checkRole('admin'), async (req, res) => {
	const users = await pool.query('SELECT * FROM users');
	const roles = await pool.query('SELECT * FROM user_roles');
	users.rows.forEach(user => {
		const userRoles = roles.rows.filter(role => role.user_id === user.id);
		user.roles = userRoles.map(role => role.role);
	});
	res.status(200).json(users.rows);
})

router.put('/roles', verifyToken, checkRole('admin'), async (req, res) => {
	const { users } = req.body;
	try {
		await pool.query('DELETE FROM user_roles');

		const values = [];
		const placeholders = [];
		let counter = 1;

		for (const user of users) {
			for (const role of user.roles) {
				values.push(user.id, role);
				placeholders.push(`($${counter}, $${counter + 1})`);
				counter += 2;
			}
		}

		if (values.length > 0) {
			const query = `INSERT INTO user_roles (user_id, role) VALUES ${placeholders.join(', ')}`;
			await pool.query(query, values);
		}

		res.status(200).send({ message: 'Roles updated successfully' });
	} catch (error) {
		console.error('Error updating roles:', error);
		res.status(500).send(getErrorHtml(error));
	}
});

// credit card 











export default router;