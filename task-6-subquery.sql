USE e_commerce;
-- Scalar Subquery in SELECT
SELECT 
    product_name,
    price,
    (SELECT category_name 
     FROM categories 
     WHERE categories.category_id = products.category_id) AS category
FROM products;

-- Subquery in WHERE with IN
SELECT product_name, price
FROM products
WHERE category_id IN (
    SELECT category_id
    FROM categories
    WHERE category_name LIKE '%Electronics%'
);

-- Subquery with EXISTS
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- Correlated Subquery
SELECT order_id, amount
FROM payments p
WHERE amount > (
    SELECT AVG(amount) 
    FROM payments
);

-- Subquery 
SELECT c.customer_name, t.total_spent
FROM customers c
JOIN (
    SELECT customer_id, SUM(price) AS total_spent
    FROM order_items
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id;



-- NULL Handle
SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE status IS NULL
);
