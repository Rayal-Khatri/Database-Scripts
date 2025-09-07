-- Find total customers by country
USE DatawarehouseAnalytics;

SELECT country, COUNT(customer_key) AS Total_Customers
FROM gold.dim_customers
GROUP BY country
ORDER BY Total_Customers DESC


-- Toal customers by gender
SELECT gender, COUNT(customer_key) AS TOTAL_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY TOTAL_customers DESC


-- Total products by category
SELECT category, COUNT(product_id) AS TOTAL_NO_OF_PRODUCTS
FROM gold.dim_products
GROUP by category
ORDER by TOTAL_NO_OF_PRODUCTS DESC


---Average cost in Each category
SELECT category, AVG(cost) AS Average_Cost
FROM gold.dim_products
GROUP BY category
ORDER BY Average_Cost DESC



--Total revenue generated from each category
SELECT p.category, SUM(s.price) AS TOTAL_SALES
FROM gold.dim_products p
RIGHT JOIN gold.fact_sales s ON p.product_key = s.product_key
GROUP BY category
ORDER BY TOTAL_SALES DESC


--Total revenue generated from each customer
SELECT f.customer_key, c.first_name, c.last_name, SUM(f.price) AS Total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c 
ON f.customer_key = c.customer_key 
GROUP BY f.customer_key, c.first_name,c.last_name
ORDER BY Total_revenue DESC


SELECT * FROM gold.dim_customers
--Destribution of sold items Across Countries
SELECT c.country, SUM(f.quantity) AS Total_produts_sold
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON f.customer_key = c.customer_key 
GROUP BY c.country
ORDER BY Total_produts_sold DESC