-- 1. Create the Database (Run this separately first if needed)
-- CREATE DATABASE "vekyrd-ecommerce-db";

-- USERS & ROLES
CREATE TABLE IF NOT EXISTS public.users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- USERS & ROLES
CREATE TABLE IF NOT EXISTS public.user_roles
(
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (user_id, role)
);

-- PRODUCTS & RELATED
CREATE TABLE IF NOT EXISTS public.products
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock INTEGER NOT NULL,
    imageurl VARCHAR(255),
    category VARCHAR(50),
    sku VARCHAR(50),
    description_large VARCHAR(1000),
    average_rating NUMERIC(3,2) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS public.product_reviews
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    product_id INTEGER NOT NULL REFERENCES public.products(id),
    rating INTEGER NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS public.wishlist
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    product_id INTEGER NOT NULL REFERENCES public.products(id)
);

-- ORDERS & CART
CREATE TABLE IF NOT EXISTS public.orders
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    status VARCHAR(50) NOT NULL,
    total_price NUMERIC(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    confirmation_number VARCHAR(15) NOT NULL,
    order_hash VARCHAR(15) NOT NULL,
    subtotal NUMERIC(10,2) NOT NULL,
    shipping NUMERIC(10,2) NOT NULL,
    taxes NUMERIC(10,2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS public.order_items
(
    id SERIAL PRIMARY KEY,
    order_id INTEGER NOT NULL REFERENCES public.orders(id),
    product_id INTEGER NOT NULL REFERENCES public.products(id),
    quantity INTEGER NOT NULL,
    price NUMERIC(10,2) NOT NULL
);


CREATE TABLE IF NOT EXISTS inventory_history (
  id SERIAL PRIMARY KEY,
  operation_type VARCHAR(50) NOT NULL,
  product_id INTEGER NOT NULL REFERENCES products(id),
  quantity INTEGER NOT NULL,
  date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



CREATE TABLE IF NOT EXISTS public.cart
(
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL REFERENCES public.products(id),
    quantity INTEGER NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    order_hash VARCHAR(255),
    order_id INTEGER REFERENCES public.orders(id),
    created_at TIMESTAMP DEFAULT NOW()
);

-- LOGIN HISTORY
CREATE TABLE IF NOT EXISTS public.login_history
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    session_id VARCHAR(100) NOT NULL UNIQUE,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    logout_time TIMESTAMP
);

-- CREDIT CARDS
CREATE TABLE IF NOT EXISTS public.credit_cards
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    cardholder_name VARCHAR(100) NOT NULL,
    card_number BYTEA NOT NULL,
    cvv VARCHAR(4) NOT NULL,
    expiration_date DATE NOT NULL,
    billing_address TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- QUESTIONNAIRE
CREATE TABLE IF NOT EXISTS public.questionnaire
(
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES public.users(id),
    hair_type VARCHAR(50),
    hair_length VARCHAR(50),
    scalp_condition VARCHAR(500),
    current_issues VARCHAR(500),
    goals VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
