-- Staff table
CREATE DATABASE Cinemofie
Go
Use Cinemofie
Go

CREATE TABLE Staff (
    StaffID CHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL CHECK (DateOfBirth <= DATEADD(YEAR, -18, GETDATE())),
    Address VARCHAR(255) NOT NULL,
    Gender CHAR(6) NOT NULL CHECK (Gender IN ('Male', 'Female'))
);

-- Supplier table
CREATE TABLE Supplier (
    SupplierID CHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Food table
CREATE TABLE Food (
    FoodID CHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(10) NOT NULL CHECK (Category IN ('Pasta', 'Salad', 'Sandwich', 'Snack', 'Fried')),
    Price DECIMAL(10, 2) NOT NULL
);

-- Drink table
CREATE TABLE Drink (
    DrinkID CHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Category VARCHAR(10) NOT NULL CHECK (Category IN ('Soft Drink', 'Tea', 'Coffee', 'Milk', 'Herbal')),
    Price DECIMAL(10, 2) NOT NULL
);

-- Purchase table
CREATE TABLE Purchase (
    PurchaseID CHAR(5) PRIMARY KEY,
    StaffID CHAR(5) NOT NULL,
    SupplierID CHAR(5) NOT NULL,
    PurchaseDate DATE NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- PurchaseDetail table
CREATE TABLE PurchaseDetail (
    PurchaseDetailID INT PRIMARY KEY IDENTITY,
    PurchaseID CHAR(5) NOT NULL,
    FoodID CHAR(5),
    DrinkID CHAR(5),
    Quantity INT NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES Purchase(PurchaseID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID),
    FOREIGN KEY (DrinkID) REFERENCES Drink(DrinkID)
);

-- Customer table
CREATE TABLE Customer (
    CustomerID CHAR(5) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender CHAR(6) NOT NULL CHECK (Gender IN ('Male', 'Female'))
);

-- Transaction table
CREATE TABLE Transaction (
    TransactionID CHAR(5) PRIMARY KEY,
    StaffID CHAR(5) NOT NULL,
    CustomerID CHAR(5) NOT NULL,
    TransactionDate DATE NOT NULL,
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- TransactionDetail table
CREATE TABLE TransactionDetail (
    TransactionDetailID INT PRIMARY KEY IDENTITY,
    TransactionID CHAR(5) NOT NULL,
    FoodID CHAR(5),
    DrinkID CHAR(5),
    Quantity INT NOT NULL,
    FOREIGN KEY (TransactionID) REFERENCES Transaction(TransactionID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID),
    FOREIGN KEY (DrinkID) REFERENCES Drink(DrinkID)
);


-- Inserting data into Staff table
INSERT INTO Staff (StaffID, Name, DateOfBirth, Address, Gender) VALUES
('ST001', 'Alice Smith', '1990-05-01', '123 Elm St', 'Female'),
('ST002', 'Bob Johnson', '1985-09-15', '456 Oak St', 'Male'),
-- Add more data to have at least 10 records
;

-- Inserting data into Supplier table
INSERT INTO Supplier (SupplierID, Name, Address) VALUES
('SU001', 'Food Supplier Inc.', '789 Maple St'),
('SU002', 'Drink Supplier LLC', '101 Pine St'),
-- Add more data to have at least 10 records
;

-- Inserting data into Food table
INSERT INTO Food (FoodID, Name, Category, Price) VALUES
('FO001', 'Spaghetti', 'Pasta', 8.50),
('FO002', 'Caesar Salad', 'Salad', 7.00),
-- Add more data as needed
;

-- Inserting data into Drink table
INSERT INTO Drink (DrinkID, Name, Category, Price) VALUES
('DR001', 'Coca Cola', 'Soft Drink', 2.50),
('DR002', 'Green Tea', 'Tea', 3.00),
-- Add more data as needed
;

-- Inserting data into Customer table
INSERT INTO Customer (CustomerID, Name, DateOfBirth, Gender) VALUES
('CU001', 'John Doe', '1988-02-20', 'Male'),
('CU002', 'Jane Roe', '1992-11-05', 'Female'),
-- Add more data to have at least 10 records
;
