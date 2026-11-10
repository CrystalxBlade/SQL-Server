             ------------------------  Practice  ------------------------



---------------- Task e-store ----------------

CREATE DATABASE estore_db

CREATE TABLE customers (
    cust_id INT IDENTITY(1,1) PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL
);

INSERT INTO customers (cust_name)
VALUES
    ('Raju'), ('Sham'), ('Paul'), ('Alex'),('Baburao') ;



CREATE TABLE orders (
    ord_id INT IDENTITY(1,1) PRIMARY KEY,
    ord_date DATE NOT NULL,
    cust_id INT NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE
);

INSERT INTO orders (ord_date, cust_id)
VALUES
    ('2025-01-01', 1),  -- Raju first order
    ('2025-02-01', 2),  -- Sham first order
    ('2025-03-01', 3),  -- Paul first order
    ('2025-04-04', 2);  -- Sham second order



CREATE TABLE products (
    p_id INT IDENTITY(1,1) PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    price NUMERIC NOT NULL
);

INSERT INTO products (p_name, price)
VALUES
    ('Laptop', 55000.00),
    ('Mouse', 500),
    ('Keyboard', 800.00),
    ('Cable', 250.00),
     ('Monitor', 12000.00);



CREATE TABLE order_items (
    item_id INT IDENTITY(1,1) PRIMARY KEY,
    ord_id INT NOT NULL,
    p_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id),
    FOREIGN KEY (p_id) REFERENCES products(p_id)
);

INSERT INTO order_items (ord_id, p_id, quantity)
VALUES
    (1, 1, 1),  -- Raju ordered 1 Laptop
    (1, 4, 2),  -- Raju ordered 2 Cables
    (2, 1, 1),  -- Sham ordered 1 Laptop
    (3, 2, 1),  -- Paul ordered 1 Mouse
    (3, 4, 5),  -- Paul ordered 5 Cables
    (4, 3, 1);  -- Sham ordered 1 Keyboard



SELECT * FROM customers
SELECT * FROM orders
SELECT * FROM products
SELECT * FROM order_items



SELECT c.cust_name, o.ord_id, p.p_name, o.ord_date, p.price, oi.quantity,
oi.quantity * p.price as Total

FROM order_items oi
JOIN products p ON oi.p_id = p.p_id
JOIN orders o ON o.ord_id = oi.ord_id
RIGHT JOIN customers c ON c.cust_id = o.cust_id


SELECT c.cust_name, COUNT(DISTINCT o.ord_id) as items

FROM order_items oi
JOIN products p ON p.p_id = oi.p_id
JOIN orders o ON o.ord_id = oi.ord_id
JOIN customers c ON c.cust_id = o.cust_id
GROUP BY c.cust_name


SELECT c.cust_name, COUNT(o.ord_id) as orders, 
SUM(oi.quantity) as total_quantity

FROM order_items oi
JOIN orders o ON o.ord_id = oi.ord_id
JOIN customers c ON c.cust_id = o.cust_id
GROUP BY c.cust_name


SELECT o.ord_date,
       SUM(oi.quantity * p.price)  AS total_shopping_amount,
       SUM(oi.quantity)            AS units_sold,
       COUNT(DISTINCT oi.p_id)     AS different_products_sold,
       COUNT(DISTINCT o.cust_id)   AS customers_purchased
FROM orders o
JOIN order_items oi ON oi.ord_id = o.ord_id
JOIN products p     ON p.p_id = oi.p_id
GROUP BY o.ord_date
ORDER BY o.ord_date;