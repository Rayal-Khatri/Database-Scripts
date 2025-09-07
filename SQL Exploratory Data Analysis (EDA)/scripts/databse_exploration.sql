--Explore all the tables of the dataset
USE DataWarehouse
SELECT * FROM INFORMATION_SCHEMA.TABLES


--Explore all the columns of the dataset
SELECT * FROM INFORMATION_SCHEMA.COLUMNS
--WHERE TABLE_NAME  = 'dim_customers'


-------DIMENSIONS EXPLORATION----------


-- Explore all countries that customers came from
USE DatawarehouseAnalytics
SELECT DISTINCT country FROM gold.dim_customers


-- Explore the major division of the products
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products



-----------DATE EXPLORATION---------------------

-- Finding the date of First and Last Order
SELECT MIN(order_date) AS first_order_date, MAX(order_date) AS last_order_date, DATEDIFF(year, MIN(order_date), MAX(order_date)) AS Years_of_sale
FROM gold.fact_sales

--Finding the youngest and oldest customers
SELECT DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest,
    DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest
FROM gold.dim_customers

select top(10) * from gold.fact_sales
select top(10) * from gold.dim_customers

-----------------MEASURE EXPLORATION ------------------------
SELECT 
    SUM(f.sales_amount) AS TOTAL_SALES, 
    AVG(f.price) AS AVG_PRICE, 
    SUM(f.quantity) AS TOTAL_ITEMS_SOLD, 
    COUNT(DISTINCT f.order_number) as TOTAL_NO_OF_ORDERS,
    (SELECT COUNT(DISTINCT product_id) FROM gold.dim_products) as TOTAL_UNIQUE_PRODUCTS,
    (SELECT COUNT(DISTINCT customer_id) FROM gold.dim_customers) AS TOTAL_CUSTOMERS,
    (select count(DISTINCT customer_key) FROM gold.fact_sales) AS CUSTOMER_WHO_ORDERED
FROM gold.fact_sales f;


SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;