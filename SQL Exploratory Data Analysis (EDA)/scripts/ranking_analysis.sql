USE DatawarehouseAnalytics

-- 5 Products with highest revenue

SELECT TOP(5) p.product_name, SUM(f.price) AS Total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY Total_revenue DESC


-- Complex but Flexibly Ranking Using Window Functions
SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(f.sales_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
    FROM gold.fact_sales f
    LEFT JOIN gold.dim_products p
        ON p.product_key = f.product_key
    GROUP BY p.product_name
) AS ranked_products
WHERE rank_products <= 5;



-- 5 worst performing Products in terms of sales
SELECT TOP(5) p.product_name, SUM(f.sales_amount) AS Total_sales
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY Total_sales ASC



-- Top 10 customers generating the highest revenue 
SELECT TOP(10) c.first_name, c.last_name, SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.first_name, c.last_name
ORDER BY total_revenue DESC


-- 3 customers with lowest orders placed
SELECT TOP(3) c.first_name, c.last_name, COUNT(Distinct f.order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
GROUP BY c.first_name, c.last_name
ORDER BY total_orders ASC