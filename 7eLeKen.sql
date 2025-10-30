
IF EXISTS(
	SELECT * FROM [7eLeKen_OLAP]..FilterTimeStamp
	WHERE TableName = 'TimeDimension'
)
BEGIN
	SELECT DISTINCT 
		x.Date as [DATE],
		DAY(x.Date) as [Day],
		MONTH(x.Date) as [Month],
		DATEPART(QUARTER,x.Date) as [Quarter],
		YEAR(x.Date) as [Year]
	FROM
		(
			SELECT SalesDate as [Date] FROM TrSalesHeader
			UNION
			SELECT PurchaseDate as [Date] FROM TrPurchaseHeader
		) as x, [CarShop_OLAP]..FilterTimeStamp as fts
	WHERE x.Date > fts.LastETL

END
ELSE
BEGIN
	SELECT DISTINCT 
		x.Date as [DATE],
		DAY(x.Date) as [Day],
		MONTH(x.Date) as [Month],
		DATEPART(QUARTER,x.Date) as [Quarter],
		YEAR(x.Date) as [Year]
	FROM
		(
			SELECT SalesDate as [Date] FROM TrSalesHeader
			UNION
			SELECT PurchaseDate as [Date] FROM TrPurchaseHeader
		) AS x

END
-- query untuk update

IF EXISTS(
	SELECT * FROM [7eLeKen_OLAP]..FilterTimeStamp
	WHERE TableName = 'TimeDimension'
)
BEGIN
	UPDATE [7eLeKen_OLAP]..FilterTimeStamp
	SET LastETL = GETDATE()
	WHERE TableName = 'TimeDimension'
END
ELSE
BEGIN
	INSERT INTO [CarShop_OLAP]..FilterTimeStamp
	VALUES ('TimeDimension',GETDATE())
END