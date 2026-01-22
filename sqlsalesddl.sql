CREATE DATABASE SalesFact;
GO

USE SalesFact;
GO

-- =========================
-- 2. CREATE TABLE
-- =========================
IF OBJECT_ID('sales', 'U') IS NOT NULL
    DROP TABLE sales;
GO

CREATE TABLE sales (
    sales_date DATE,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);
GO

-- =========================
-- 3. INSERT DATA
-- =========================
INSERT INTO sales (sales_date, product, quantity, price) VALUES
('2025-01-01', 'A', 10, 50000),
('2025-01-01', 'B', 5, 75000),
('2025-01-02', 'A', 7, 50000),
('2025-01-02', 'C', 3, 100000),
('2025-01-03', 'B', 4, 75000);
GO

-- =========================
-- 4. CHECK DATA
-- =========================
SELECT * FROM sales;
GO

-- =========================
-- 5. TOTAL REVENUE
-- =========================
SELECT 
    SUM(quantity * price) AS total_revenue
FROM sales;
GO

-- =========================
-- 6. TOTAL SALES PER PRODUCT
-- =========================
SELECT 
    product,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product;
GO

-- =========================
-- 7. BEST SELLING PRODUCT (SQL SERVER)
-- =========================
SELECT TOP 1
    product,
    SUM(quantity * price) AS total_sales
FROM sales
GROUP BY product
ORDER BY total_sales DESC;
GO

-- =========================
-- 8. HIGH VALUE TRANSACTION
-- =========================
SELECT 
    sales_date,
    product,
    quantity,
    price,
    (quantity * price) AS total_sales
FROM sales
WHERE (quantity * price) > 300000;
GO

-- =========================
-- 9. PRODUCT RANKING
-- =========================
SELECT 
    product,
    SUM(quantity * price) AS total_sales,
    RANK() OVER (ORDER BY SUM(quantity * price) DESC) AS ranking
FROM sales
GROUP BY product;
GO

