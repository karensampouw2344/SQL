SELECT benefitid, benefitName, benefitPrice FROM
[7eLeKen]..MsBenefit

SELECT * FROM [7eLeKen_OLAP]..CustomerDimension

SELECT customerid,customerName,customerdob,customerphone,customeraddress,customergender 
FROM [7eLeKen]..MsCustomer 

SELECT staffId,staffname,staffdob,staffsalary,staffgender
FROM [7eLeKen]..MsStaff

SELECT * FROM [7eLeKen_OLAP]..StaffDimension

