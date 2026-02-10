# Vekyrd E-Commerce Database Setup

This guide will help you set up the PostgreSQL database for the Vekyrd e-commerce application.

## Prerequisites

- PostgreSQL installed on your system
- Node.js and npm (for the application)
- Terminal/Command line access

## Database Setup Steps

### 1. Create the Database

Run the following command to create the database:

```bash
sudo -u postgres psql -c 'CREATE DATABASE "vekyrd-ecommerce-db";'
```

### 2. Create Tables (queries in db/migration/1-create-tables.sql)

Execute the table creation script:

```bash
psql -U postgres -d vekyrd-ecommerce-db -f 1-create-tables.sql
```

### 3. Restore Sample Data (queries in db/migration/2-restore-data.sql)

Load the initial data into the database:

```bash
psql -U postgres -d vekyrd-ecommerce-db -f 2-restore-data.sql
```

# LOCAL POSTGRES
DB_USER=postgres
DB_HOST=127.0.0.1
DB_NAME=vekyrd-ecommerce-db
DB_PASSWORD=your_postgres_password
DB_PORT=5432
PORT=5000

# JWT SECRETS
JWT_SECRET=your_jwt_secret_here
JWT_SECRET_REFRESH=your_jwt_refresh_secret_here

# ENCRYPTION
POSTGRESS_ENCRYPTION_KEY=your_encryption_key_here

# SUPABASE (Optional - for production)
DATABASE_URL=your_supabase_database_url
SUPABASE_SERVICE_ROLE_KEY=your_supabase_service_role_key
SUPABASE_ANON_KEY=your_supabase_anon_key

# OPENAI
OPENAI_API_KEY=your_openai_api_key

**⚠️ IMPORTANT SECURITY NOTES:**
- Never commit the `.env` file to version control
- Add `.env` to your `.gitignore` file
- Change all secrets and passwords in production
- Use strong, randomly generated values for JWT secrets and encryption keys

## Database Schema Overview

### Tables Created

- **users** - User accounts
- **user_roles** - User role assignments
- **products** - Product catalog
- **product_reviews** - Customer reviews
- **wishlist** - User wishlists
- **orders** - Order records
- **order_items** - Items within orders
- **cart** - Shopping cart
- **inventory_history** - Stock movement tracking
- **login_history** - User session tracking
- **credit_cards** - Encrypted payment methods
- **questionnaire** - Hair care questionnaire responses

### Sample Data Included

- 7 users (including 1 admin)
- 11 hair care products across multiple categories
- 6 product reviews
- 3 sample orders
- 5 wishlist entries

### Default Credentials

**Admin Account:**
- Username: `admin`
- Email: `admin@example.com`
- Password: (use bcrypt hash provided)

**Test User:**
- Username: `jorge0481rd`
- Email: `jorge0481rd@gmail.com`
- Password: (use bcrypt hash provided)

## Verification

To verify the setup was successful:

```bash
sudo -u postgres psql vekyrd-ecommerce-db
```

Then run:

```sql
-- Check tables
\dt

-- Verify data
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
```

## Troubleshooting

### Connection Issues

If you can't connect to the database:

```bash
# Check PostgreSQL status
sudo systemctl status postgresql

# Start PostgreSQL if needed
sudo systemctl start postgresql
```

### Permission Issues

If you encounter permission errors:

```bash
# Grant privileges
sudo -u postgres psql
GRANT ALL PRIVILEGES ON DATABASE "vekyrd-ecommerce-db" TO postgres;
```

### Reset Database

To completely reset the database:

```bash
cd ./db/migration
sudo -u postgres psql -c 'DROP DATABASE IF EXISTS "vekyrd-ecommerce-db";'
sudo -u postgres psql -c 'CREATE DATABASE "vekyrd-ecommerce-db";'
psql -U postgres -d vekyrd-ecommerce-db -f 1-create-tables.sql
psql -U postgres -d vekyrd-ecommerce-db -f 2-restore-data.sql
```

## Next Steps

1. Install application dependencies: `npm install`
2. Start the development server: `npm run dev`
3. Access the application at `http://localhost:5000`

## Support

For issues or questions, please contact the development team or refer to the project documentation.
