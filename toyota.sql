-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2025 at 10:31 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toyota`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` char(5) NOT NULL,
  `CustomerName` varchar(150) NOT NULL,
  `CustomerAddress` varchar(150) NOT NULL,
  `CustomerPhoneNumber` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `CustomerName`, `CustomerAddress`, `CustomerPhoneNumber`) VALUES
('CUA12', 'John Doe', 'St Broadway', 2147483647),
('CUB34', 'Jane Smith', 'St Elm Street', 2147483647),
('CUC56', 'Alice Johnson', 'St Maple Ave', 2147483647),
('CUD78', 'Bob Brown', 'St Oak Lane', 2147483647),
('CUE90', 'Charlie White', 'St Pine Blvd', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` char(5) NOT NULL CHECK (`EmployeeID` like 'EM[A-Z][0-9][0-9]'),
  `EmployeeName` varchar(150) NOT NULL,
  `EmployeeGender` varchar(6) NOT NULL CHECK (`EmployeeGender` in ('Male','Female')),
  `EmployeeAddress` varchar(150) NOT NULL CHECK (`EmployeeAddress` like 'St%'),
  `EmployeePhoneNumber` varchar(12) NOT NULL CHECK (`EmployeePhoneNumber` like '08%' and octet_length(`EmployeePhoneNumber`) = 12)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Inserting new employee records
INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress, EmployeePhoneNumber)
VALUES ('EMA01', 'Cindy Saptaputri', 'Female', 'St Oak Street', '+852 9574 8496');

INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress, EmployeePhoneNumber)
VALUES ('EMB23', 'Kevina Ardelia', 'Female', 'St Pine Avenue', '+44 7825 708039');

INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress, EmployeePhoneNumber)
VALUES ('EMC45', 'John Davincent', 'Male', 'St Maple Road', '+62 812 7629 6731');

INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress, EmployeePhoneNumber)
VALUES ('EMD67', 'Aaron Nathanael', 'Male', 'St Elm Street', '+62 813 8555 0978');

INSERT INTO Employee (EmployeeID, EmployeeName, EmployeeGender, EmployeeAddress, EmployeePhoneNumber)
VALUES ('EME89', 'Selvi Siau Fani', 'Female', 'St Cedar Lane', '+62 811 1111 8262');


--
-- Table structure for table `sparepart`
--

CREATE TABLE `sparepart` (
  `SparePartID` char(5) NOT NULL,
  `SparePartName` varchar(150) NOT NULL,
  `VehicleID` char(5) NOT NULL,
  `SupplierID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` char(5) NOT NULL,
  `SupplierName` varchar(150) NOT NULL,
  `SupplierAddress` varchar(150) NOT NULL,
  `SupplierPhoneContact` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` char(5) NOT NULL,
  `CustomerID` char(5) NOT NULL,
  `EmployeeID` char(5) NOT NULL,
  `TransactionDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`TransactionID`, `CustomerID`, `EmployeeID`, `TransactionDate`) VALUES
('TRA01', '', '', '2025-01-01'),
('TRB23', '', '', '2025-02-15'),
('TRC45', '', '', '2025-03-20'),
('TRD67', '', '', '2025-04-10'),
('TRE89', '', '', '2025-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `VehicleID` char(5) NOT NULL,
  `VehicleName` varchar(150) NOT NULL,
  `VehiclePrice` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `sparepart`
--
ALTER TABLE `sparepart`
  ADD PRIMARY KEY (`SparePartID`),
  ADD KEY `VehicleID` (`VehicleID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`VehicleID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sparepart`
--
ALTER TABLE `sparepart`
  ADD CONSTRAINT `sparepart_ibfk_1` FOREIGN KEY (`VehicleID`) REFERENCES `vehicle` (`VehicleID`),
  ADD CONSTRAINT `sparepart_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
