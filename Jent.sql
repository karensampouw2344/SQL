--1. 
CREATE VIEW ViewDeliveryTypeInformation AS
SELECT DeliveryTypeID, DeliveryTypeName, DeliveryTypePrice
FROM MsDeliveryType
WHERE DeliveryTypePrice between 50000 and 65000

SELECT * FROM ViewDeliveryTypeInformation

--2.


--3. 
SELECT mc.CustomerID, 
CustomerName, 
CustomerDOB,
COUNT(TransactionId)
FROM MsCustomer mc JOIN TransactionHeader th ON mc.CustomerId = th.CustomerId
SELECT
   mc.CustomerID,
   CustomerName,
   CustomerDOB,
   'Number of Transactions' = COUNT(TransactionID),
   FROM MsCustomer mc JOIN TransactionHeader th ON MsCustomerId = th.CustomerId,
   WHERE DATEDIFF(DAY, TransactionDate,'2021-08-17') < 17
   GROUP BY mc.CustomerID,
   CustomerName,
   CustomerDOB
   UNION
   SELECT
     mc.CustomerID,
	 CustomerName,
	 CustomerDOB
	 'Number of Transactions' = COUNT(TransactionID)
	 FROM MsCustomer mc JOIN TransactionHeader th ON mc.CustomerId = th.CustomerId
	 WHERE LEN(CustomerName) > 6
	 GROUP BY mc.CustomerID,
	 CustomerName,
	 CustomerDOB

--4
SELECT th.TransactionId,
'Total Amount' = SUM(DeliveryTypePrice),
TransactionDate
FROM TransactionHeader th JOIN TransactionDetail td
ON th.TransactionId = td.TransactionId
JOIN MsDeliveryType mdt
ON td.DeliveryTypeId = mdt.DeliveryTypeId
WHERE DeliveryTypeName LIKE'% %'

--5
SELECT CustomerName,
'CustomerPhone' = STUFF(CustomerPhone, 1, 2, '+62')
FROM MsCustomer
WHERE YEAR(CustomerDOB) = 2001

--6
SELECT td.TransactionId,
'TransactionDate' = CONVERT(VARCHAR(50), TransactionDate)
'Package Origin' = UPPER(SUBSTRING(CityName, 1,3))
FROM MsCity mc JOIN TransactionHeader th
ON mc.CityId = th.CityOriginID
JOIN TransactionDetail td
ON td.TransactionId = th.Transactionid
JOIN MsDelivery mdt
On td.DeliveryTypeId = mdt.DeliveryTypeId,
(SELECT 'AVG' = AVG(DeliveryTypePrice) FROM MsDeliveryType = AVG(DeliveryTypePrice) FROM MsDeliveryType) AS x
WHERE CityName LIKE '%Java%'
AND DeliveryTypePrice < x.Avg

--7. 


--8. 
SELECT

--9.

--10.
SELECT CustomerName, 'Number of Transactions' = COUNT(TransactionId)
FROM MsCustomer mc JOIN TransactionHeader th
ON mc.CustomerId = th.CustomerId
WHERE CustomerAddress LIKE '%STREET'
GROUP BY CustomerName













