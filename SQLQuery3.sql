-- 1. Display Staffs PurchaseDate and Total Food Purchase for male staff purchases in 2019
SELECT UPPER(s.Name) AS StaffName, p.PurchaseDate, COUNT(pd.FoodID) AS TotalFoodPurchase
FROM Staff s
JOIN Purchase p ON s.StaffID = p.StaffID
JOIN PurchaseDetail pd ON p.PurchaseID = pd.PurchaseID
WHERE s.Gender = 'Male' AND YEAR(p.PurchaseDate) = 2019
GROUP BY s.Name, p.PurchaseDate;

-- 2. Display PurchaseID SupplierName and Total Drink Purchase for even PurchaseID and Total Drink Purchase < 5
SELECT p.PurchaseID, LOWER(sup.Name) AS SupplierName, SUM(pd.Quantity) AS TotalDrinkPurchase
FROM Purchase p
JOIN Supplier sup ON p.SupplierID = sup.SupplierID
JOIN PurchaseDetail pd ON p.PurchaseID = pd.PurchaseID
WHERE pd.DrinkID IS NOT NULL AND SUM(pd.Quantity) < 5 AND p.PurchaseID % 2 = 0
GROUP BY p.PurchaseID, sup.Name;

-- 3. Display Transaction Date, Highest Food Price Sold, Lowest Drink Price Sold before June 2023
SELECT FORMAT(t.TransactionDate, 'MMM dd, yyyy') AS TransactionDate, 
       MAX(f.Price) AS HighestFoodPriceSold,
       MIN(d.Price) AS LowestDrinkPriceSold
FROM [Transaction] t
LEFT JOIN TransactionDetail td ON t.TransactionID = td.TransactionID
LEFT JOIN Food f ON td.FoodID = f.FoodID
LEFT JOIN Drink d ON td.DrinkID = d.DrinkID
WHERE t.TransactionDate < '2023-06-01'
GROUP BY t.TransactionDate;

-- 4. Display Staff's First Name, FoodCategory, Average and Total Food Purchased for Fried category
SELECT LOWER(SUBSTRING(s.Name, 1, CHARINDEX(' ', s.Name) - 1)) AS FirstName,
       f.Category AS FoodCategory,
       AVG(pd.Quantity) AS AverageTotalFoodPurchased,
       SUM(pd.Quantity) AS TotalFoodPurchased
FROM Staff s
JOIN Purchase p ON s.StaffID = p.StaffID
JOIN PurchaseDetail pd ON p.PurchaseID = pd.PurchaseID
JOIN Food f ON pd.FoodID = f.FoodID
WHERE f.Category = 'Fried' AND AVG(pd.Quantity) > 2
GROUP BY s.Name, f.Category;

-- 5. Display TransactionID, Drink Transaction Forecast, and Drink Quantity for Soft Drink or Herbal category
SELECT t.TransactionID,
       DATEADD(YEAR, 1, t.TransactionDate) AS DrinkTransactionForecast,
       CAST(pd.Quantity AS VARCHAR) + ' Cup' AS DrinkQuantity
FROM [Transaction] t
JOIN TransactionDetail pd ON t.TransactionID = pd.TransactionID
JOIN Drink d ON pd.DrinkID = d.DrinkID
WHERE d.Category IN ('Soft Drink', 'Herbal') AND pd.Quantity > 1;

-- 6. Alias Subquery 1
SELECT s.StaffID,
       FORMAT(t.TransactionDate, 'dd MMM yyyy') AS TransactionDate,
       'Movie ' + SUBSTRING(m.MovieID, 3, LEN(m.MovieID) - 2) AS MovieIdentification,
       'Film ' + m.Name AS MovieName,
       m.Category AS MovieCategory
FROM Staff s
JOIN [Transaction] t ON s.StaffID = t.StaffID
JOIN Movie m ON t.MovieID = m.MovieID
WHERE m.Duration > (SELECT AVG(Duration) FROM Movie) AND m.MovieID = 'MO003';

-- 7. Alias Subquery 2
SELECT SUBSTRING(c.Name, CHARINDEX(' ', c.Name) + 1, LEN(c.Name) - CHARINDEX(' ', c.Name)) AS LastName,
       SUM(td.Quantity * m.Price) AS TotalMovieSold
FROM Customer c
JOIN [Transaction] t ON c.CustomerID = t.CustomerID
JOIN TransactionDetail td ON t.TransactionID



