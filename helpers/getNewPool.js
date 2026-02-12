import dotenv from 'dotenv';
import pkg from 'pg';

dotenv.config();

const { Pool } = pkg;

let pool;

const  getNewPool = () => {
  if (pool) return pool;

  const isProd = process.env.NODE_ENV === 'production';

  pool = new Pool(
    isProd
      ? {
          connectionString: process.env.PROD_DATABASE_URL,
        }
      : {
          user: process.env.DB_USER,
          host: process.env.DB_HOST,
          database: process.env.DB_NAME,
          password: process.env.DB_PASSWORD,
          port: Number(process.env.DB_PORT),
        }
  );

  return pool;
};

export default getNewPool;
