import getNewPool from '../helpers/getNewPool.js';


const pool = getNewPool();

export const checkRole = (roles) => {
  return async (req, res, next) => {
    try {
      const requiredRoles = Array.isArray(roles) ? roles : [roles];

      if (!req.user || !req.user.id) {
		console.log("req.user", req.user)
        return res.status(401).json({ message: 'User not authenticated, nop...' });
      }

      const userId = req.user.id;
      const response = await pool.query('SELECT * FROM user_roles WHERE user_id = $1', [userId]);
      const userRoles = response.rows.map(role => role.role.toLowerCase());

      const hasRequiredRole = requiredRoles.some(role => userRoles.includes(role.toLowerCase()));

      if (!hasRequiredRole) {
        return res.status(403).json({ message: 'Access denied', user: req.user.id, roles: userRoles });
      }

      next();
    } catch (err) {
      console.error(err.message);
      res.status(500).json({ message: 'Server error' });
    }
  };
};
