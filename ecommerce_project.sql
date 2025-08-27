-- Create Tables

-- 1. Customers
CREATE TABLE IF NOT EXISTS Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- 2. Orders
CREATE TABLE IF NOT EXISTS Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT REFERENCES Customers(customer_id)
);

-- 3. Products
CREATE TABLE IF NOT EXISTS Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- 4. Categories
CREATE TABLE IF NOT EXISTS Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- (Relational Tables)
ALTER TABLE Products
ADD COLUMN category_id INT REFERENCES Categories(category_id);

-- 5. Payments
CREATE TABLE IF NOT EXISTS Payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT UNIQUE REFERENCES Orders(order_id),
    payment_method VARCHAR(50),
    payment_date DATE,
    amount DECIMAL(10,2)
);

-- OrderItems 
CREATE TABLE IF NOT EXISTS OrderItems (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES Orders(order_id),
    product_id INT NOT NULL REFERENCES Products(product_id),
    quantity INT NOT NULL DEFAULT 1,
    item_price DECIMAL(10,2) NOT NULL
);


-- Insert Sample Data

-- categories — Product Categories
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Books'),
('Clothing');

-- products — Products
INSERT INTO products (product_name, price, category_id) VALUES
('Laptop', 1499.99, 1),
('Wireless Headphones', 199.99, 1),
('Fiction Novel', 24.99, 2),
('T-Shirt', 19.99, 3);

-- customers — Customers
INSERT INTO customers (first_name, last_name, email, city) VALUES
('John', 'Smith', 'john.smith@example.com', 'New York'),
('Emma', 'Johnson', 'emma.johnson@example.com', 'Los Angeles'),
('Michael', 'Brown', 'michael.brown@example.com', 'Chicago');

-- orders — Orders
INSERT INTO orders (order_date, customer_id) VALUES
('2025-08-01', 1),
('2025-08-02', 2),
('2025-08-03', 1);

-- payments — Payments
INSERT INTO payments (order_id, payment_method, payment_date, amount) VALUES
(1, 'Credit Card', '2025-08-01', 1699.98),
(2, 'Bank Transfer', '2025-08-02', 24.99),
(3, 'Cash on Delivery', '2025-08-03', 19.99);

-- orderitems — Order Items
INSERT INTO orderitems (order_id, product_id, quantity, item_price) VALUES
(1, 1, 1, 1499.99),     -- Laptop
(1, 2, 1, 199.99),      -- Wireless Headphones
(2, 3, 1, 24.99),       -- Fiction Novel
(3, 4, 1, 19.99);       -- T-Shirt


-- Basic SELECT Queries for Verification

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM products;

SELECT * FROM categories;

SELECT * FROM payments;

SELECT * FROM orderitems;


-- JOIN Queries to Test Relationships


-- Customer ↔ Orders
SELECT o.order_id, o.order_date, c.first_name, c.last_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Products ↔ Categories
SELECT oi.order_id, p.product_name, cat.category_name, oi.quantity
FROM orderitems oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id;

-- Orders ↔ Payments
SELECT o.order_id, c.first_name, pay.payment_method, pay.amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments pay ON o.order_id = pay.order_id;


-- Checking the Accuracy of Database Relationships

-- 1. Customers ↔ Orders (1:M)
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_id,
    o.order_date
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 2. Orders ↔ Payments (1:1)
SELECT 
    o.order_id,
    o.order_date,
    p.payment_method,
    p.amount
FROM orders o
JOIN payments p ON o.order_id = p.order_id;

-- Categories ↔ Products (1:M)
SELECT 
    cat.category_name,
    p.product_name,
    p.price
FROM categories cat
JOIN products p ON cat.category_id = p.category_id;

-- Orders ↔ OrderItems ↔ Products (M:N)
SELECT 
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.item_price
FROM orders o
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Full JOIN: Customer → Order → OrderItem → Product → Category → Payment
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    o.order_id,
    o.order_date,
    p.product_name,
    cat.category_name,
    oi.quantity,
    pay.payment_method,
    pay.amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
JOIN payments pay ON o.order_id = pay.order_id;










