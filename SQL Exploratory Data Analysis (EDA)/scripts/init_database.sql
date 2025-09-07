USE MASTER;
GO

IF EXISTS( SELECT 1 FROM sys.databases WHERE name = 'DatawarehouseAnalytics')
BEGIN
    ALTER DATABASE DatawarehouseAnalytics SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DatawarehouseAnalytics;
    PRINT 'Dropped existing database: DatawarehouseAnalytics';
END;
GO

CREATE DATABASE DatawarehouseAnalytics;
GO


USE DatawarehouseAnalytics;
GO

CREATE SCHEMA gold;
GO

IF OBJECT_ID('gold.dim_customers', 'U') IS NOT NULL
    DROP TABLE gold.dim_customers;

CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	create_date date
);
GO


IF OBJECT_ID('gold.dim_products', 'U') IS NOT NULL
    DROP TABLE gold.dim_products;

CREATE TABLE gold.dim_products(
	product_key int ,
	product_id int ,
	product_number nvarchar(50) ,
	product_name nvarchar(50) ,
	category_id nvarchar(50) ,
	category nvarchar(50) ,
	subcategory nvarchar(50) ,
	maintenance nvarchar(50) ,
	cost int,
	product_line nvarchar(50),
	start_date date 
);
GO

IF OBJECT_ID('gold.fact_sales', 'U') IS NOT NULL
    DROP TABLE gold.fact_sales;
CREATE TABLE gold.fact_sales(
	order_number nvarchar(50),
	product_key int,
	customer_key int,
	order_date date,
	shipping_date date,
	due_date date,
	sales_amount int,
	quantity tinyint,
	price int 
);
GO



TRUNCATE TABLE gold.dim_customers

BULK INSERT gold.dim_customers
FROM 'C:\Users\user\Desktop\Repositories\Database-Scripts\SQL Exploratory Data Analysis (EDA)\datasets\gold.dim_customers.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
GO

--SELECT TOP(10) *from gold.dim_customers;


TRUNCATE TABLE gold.dim_products

BULK INSERT gold.dim_products
FROM 'C:\Users\user\Desktop\Repositories\Database-Scripts\SQL Exploratory Data Analysis (EDA)\datasets\gold.dim_products.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK 
);
GO

--SELECT TOP(10) * FROM gold.dim_products 



TRUNCATE TABLE gold.fact_sales

BULK INSERT gold.fact_sales
FROM 'C:\Users\user\Desktop\Repositories\Database-Scripts\SQL Exploratory Data Analysis (EDA)\datasets\gold.fact_sales.csv'
WITH(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
GO 

--SELECT TOP(15) * FROM gold.fact_sales;