SELECT branchNo, LEFT(street, 3) AS ShortStreetName
FROM branch;

SELECT propertyNo, RIGHT(postcode, 4) AS PostcodeSuffix
FROM forrent;

SELECT staffNo, LTRIM(fName) AS TrimmedFirstName, LTRIM(lName) AS TrimmedLastName
FROM staff;

SELECT staffNo, fName, lName, MONTH(DOB) AS BirthMonth
FROM staff;

SELECT clientNo, branchNo, staffNo, YEAR(dateJoined) AS JoinedYear
FROM registration;

SELECT branchNo, LEFT(street, 3) AS ShortStreetName
FROM branch
WHERE city = 'Glasgow' AND postcode LIKE '%11%';

SELECT propertyNo, RIGHT(postcode, 4) AS PostcodeSuffix
FROM forrent
WHERE type = 'Flat' AND rooms > 2;


