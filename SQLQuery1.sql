CREATE TABLE Borrowers (
    BorrowerID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Address VARCHAR(255),
    Birth_Date DATE,
    Email VARCHAR(100),
    Telephone_Number VARCHAR(20),
    Member_Number INT UNIQUE,
    Registration_Date DATE
);

CREATE TABLE Books (
    BookCode INT PRIMARY KEY,
    Book_Title VARCHAR(255)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BorrowerID INT,
    BookCode INT,
    Borrowed_Date DATE,
    Return_Date DATE,
    Penalty DECIMAL(10, 2),
    FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
    FOREIGN KEY (BookCode) REFERENCES Books(BookCode)
);

INSERT INTO Borrowers (BorrowerID, Full_Name, Address, Birth_Date, Email, Telephone_Number, Member_Number, Registration_Date)
VALUES (1, 'Alexandra Westin', 'Address', '2000-01-01', 'alexandra@example.com', '1234567890', 1001, '2024-04-26');

UPDATE Borrowers
SET Full_Name = 'Alexandra Westina'
WHERE Full_Name = 'Alexandra Westin';

SELECT *
FROM Borrowers
WHERE Full_Name LIKE 'A%';


