-- CREATE TABLE CustomerDimension(
--    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
--    CustomerID INT ,       -- Original OLTP ID
--    CustomerName VARCHAR(100),
--    CustomerGender CHAR(1),        -- M/F
--    CustomerEmail VARCHAR(100),     -- Can be updated (SCD Type 1)
--);

--  CREATE TABLE StaffDimension(
--    StaffCode INT IDENTITY(1,1) PRIMARY KEY,
--    StaffID INT,      -- Original OLTP ID
--    StaffName VARCHAR(100),
--    StaffGender CHAR(1),           
--    StaffSalary INT,      -- SCD Type 2
--    ValidFrom DATETIME,
--	  ValidTo DATETIME

--);

--CREATE TABLE CarDimension(
--    CarCode INT IDENTITY(1,1) PRIMARY KEY,
--    CarID INT ,            -- Original OLTP ID
--    CarName VARCHAR(100),
--    CarPrice INT,        -- Price, SCD Type 2
--    ValidFrom DATETIME,
--	  ValidTo DATETIME
--);
CREATE TABLE DateDimension (
    DateKey INT PRIMARY KEY, -- Format YYYYMMDD
    [Date] DATE,
    [Day] INT,
    [Month] INT,
    [Quarter] INT,
    [Year] INT
);