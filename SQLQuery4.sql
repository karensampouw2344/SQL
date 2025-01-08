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
