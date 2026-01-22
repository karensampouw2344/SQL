/* =========================
   1. CREATE DATABASE
========================= */
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SalesFact')
BEGIN
    CREATE DATABASE SalesFact;
END
GO

USE SalesFact;
GO

/* =========================
   2. DROP TABLE IF EXISTS
========================= */
IF OBJECT_ID('fact_sales', 'U') IS NOT NULL DROP TABLE fact_sales;
IF OBJECT_ID('dim_product', 'U') IS NOT NULL DROP TABLE dim_product;
GO

/* =========================
   3. CREATE DIMENSION TABLE
========================= */
CREATE TABLE dim_product (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_code VARCHAR(10),
    product_name VARCHAR(50)
);
GO

/* =========================
   4. CREATE FACT TABLE
========================= */
CREATE TABLE fact_sales (
    sales_id INT IDENTITY(1,1) PRIMARY KEY,
    sales_date DATE,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);
GO

/* =========================
   5. INSERT DATA
========================= */
INSERT INTO dim_product (product_code, product_name) VALUES
('A', 'Product A'),
('B', 'Product B'),
('C', 'Product C');
GO

INSERT INTO fact_sales (sales_date, product_id, quantity, price) VALUES
('2025-01-01', 1, 10, 50000),
('2025-01-01', 2, 5, 75000),
('2025-01-02', 1, 7, 50000),
('2025-01-02', 3, 3, 100000),
('2025-01-03', 2, 4, 75000);
GO

/* =========================
   6. CHECK DATA (JOIN)
========================= */
SELECT 
    f.sales_date,
    p.product_name,
    f.quantity,
    f.price
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id;
GO

/* =========================
   7. TOTAL SALES PER PRODUCT (JOIN)
========================= */
SELECT 
    p.product_name,
    SUM(f.quantity * f.price) AS total_sales
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_name;
GO

/* =========================
   8. BEST SELLING PRODUCT (SUBQUERY)
========================= */
SELECT TOP 1
    product_name,
    total_sales
FROM (
    SELECT 
        p.product_name,
        SUM(f.quantity * f.price) AS total_sales
    FROM fact_sales f
    JOIN dim_product p
        ON f.product_id = p.product_id
    GROUP BY p.product_name
) x
ORDER BY total_sales DESC;
GO

/* =========================
   9. ABOVE AVERAGE SALES (SUBQUERY)
========================= */
SELECT 
    p.product_name,
    SUM(f.quantity * f.price) AS total_sales
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(f.quantity * f.price) > (
    SELECT AVG(quantity * price)
    FROM fact_sales
);
GO

/* =========================
   10. PRODUCT RANKING (CTE)
========================= */
WITH product_sales AS (
    SELECT 
        p.product_name,
        SUM(f.quantity * f.price) AS total_sales
    FROM fact_sales f
    JOIN dim_product p
        ON f.product_id = p.product_id
    GROUP BY p.product_name
)
SELECT 
    product_name,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS ranking
FROM product_sales;
GO

/* =========================
   11. HIGH VALUE TRANSACTION (JOIN + FILTER)
========================= */
SELECT 
    f.sales_date,
    p.product_name,
    f.quantity,
    f.price,
    (f.quantity * f.price) AS total_sales
FROM fact_sales f
JOIN dim_product p
    ON f.product_id = p.product_id
WHERE (f.quantity * f.price) > 300000;
GO
