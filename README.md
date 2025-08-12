# Day6-Sql-internship
# SQL Internship Task 6 - Subqueries & Nested Queries

## 📌 Objective
Practice writing **scalar**, **correlated**, and **nested** subqueries using an e-commerce database.

## 🗂 Tables Used
- `categories`
- `products`
- `customers`
- `orders`
- `order_items`
- `payments`

## 🔍 Queries Included
1. Scalar subquery in SELECT  
2. Subquery in WHERE with IN  
3. Subquery with EXISTS  
4. Correlated subquery  
5. Derived table in FROM   
6. NULL handling with subquery

## 💻 Sample Query
```sql
-- Customers who placed orders
SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);
