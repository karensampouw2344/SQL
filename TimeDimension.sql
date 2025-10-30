CREATE TABLE TimeDimension (
    [TimeKey] INT PRIMARY KEY,             -- Format: YYYYMMDD
    [FullDate] DATE,
    [Day] INT,
    [Month] INT,
    [MonthName] VARCHAR(15),
    [Quarter] INT,
    [Year] INT,
    [DayOfWeek] INT,
    [DayNameOfWeek] VARCHAR(15),
    [IsWeekend] BIT
);
