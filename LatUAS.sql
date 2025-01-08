--1 
SELECT * FROM
MsFisherman mf FULL OUTER JOIN TransactionHeader th
ON mf.FishermanID = th.FishermanID 

SELECT * FROM
MsFisherman mf LEFT JOIN TransactionHeader th
ON mf.FishermanID = th.FishermanID 

SELECT * FROM
MsFisherman mf RIGHT JOIN TransactionHeader th
ON mf.FishermanID = th.FishermanID 

--2
SELECT mc.CustomerID, CustomerName, FishermanName,
TransactionDate
FROM MsCustomer mc JOIN TransactionHeader th
ON mc.CustomerID = th.CustomerID
JOIN MsFisherman mf
ON th.FishermanID = mf.FishermanID
WHERE DATENAME(QUARTER, TransactionDate) = 2
UNION
SELECT mc.CustomerID, CustomerName, FishermanName, TransactionDate
FROM MsCustomer mc JOIN TransactionHeader th
ON mc.CustomerID = th.CustomerID
JOIN MsFisherman mf
ON th.FishermanID = mf.FishermanID
WHERE DATENAME(QUARTER, TransactionDate) = 3

--3
SELECT mc.CustomerID, CustomerName, CustomerGender, TransactionDate
FROM MsCustomer mc JOIN TransactionHeader th
ON mc.CustomerID = th.CustomerID
WHERE MONTH(TransactionDate) BETWEEN 1 AND 5
EXCEPT --kecuali
SELECT mc.CustomerID, CustomerName, CustomerGender, TransactionDate
FROM MsCustomer mc JOIN TransactionHeader th
ON mc.CustomerID = th.CustomerID
WHERE MONTH(TransactionDate) BETWEEN 6 AND 12

--4
SELECT FishermanID, FishermanName 
FROM MsFisherman
WHERE FishermanID NOT IN
(SELECT FishermanID
FROM TransactionHeader)

--5
SELECT FishermanName, TransactionDate
FROM MsFisherman mf JOIN TransactionHeader th
ON mf.FishermanID = th.FishermanID
WHERE EXISTS(
SELECT * 
   FROM TransactionDetail td JOIN MsFish mf
   ON td.FishID = mf.FishID
   WHERE th.TransactionID = td.TransactionID
   FishPrice > 35
)

--6 
CREATE VIEW GrouperTransactionInMei
AS
SELECT 
TransactionID, TransactionDate
FROM TransactionHeader
WHERE TransactionID IN(
SELECT TransactionID
FROM TransactionDetail td JOIN MsFish mf
ON td.FishID = mf.FishID
JOIN MsFishType mft ON mf.FishTypeID = mft.FishTypeID
WHERE FishTypeName = 'Grouper')
AND DATEPART(MONTH,TransactionDate) = 5

SELECT * FROM GrouperTransactionInMei

--7
ALTER VIEW GrouperTransactionInMei
as 
SELECT
TransactionID, TransactionDate FROM TransactionHeader 
WHERE TransactionID In(
SELECT TransactionID 
FROM TransactionDetail td JOIN MsFish mf
ON td.FishID = mf.FishID
JOIN MsFishType mft ON mf.FishTypeID = mft.FishTypeID
WHERE FishTypeName = 'Grouper')
AND DATEPART(MONTH, TransactionDate) = 5
AND DATEPART(DAY, TransactionDate) > 23

SELECT * FROM GrouperTransactionInMei
ORDER BY TransactionDate 

--8
CREATE VIEW TopBuyer
AS
SELECT mc.CustomerID, CustomerName, TotalTransaction = COUNT(TransactionID)
FROM MsCustomer mc JOIN TransactionHeader th
ON mc.CustomerID = th.CustomerID
GROUP BY mc.CustomerID, CustomerName
HAVING COUNT (TransactionID) > ( -- validasi
SELECT AVG(x.TotalTrans)
FROM(
SELECT COUNT(TransactionID) AS TotalTrans -- ambil data
FROM TransactionHeader
GROUP BY CustomerID
)x
)

SELECT * FROM Topbuyer

--9
SELECT * FROM TransactionHeader
WHERE TransactionDate > SOME (SELECT TransactionDate FROM TransactionHeader)

--10
SELECT FishID, FishName
FROM MsFish mf
WHERE NOT EXISTS (
SELECT FishID
FROM TransactionDetail td
WHERE mf.FishID = td.FishID
)










