```mysql
USE lab_mysql;
```


CREATE TABLE Cars (
VIN VARCHAR(255), 
Manufacturer VARCHAR(255), 
Model VARCHAR(255), 
ModYear INT, 
Color VARCHAR(255)
);

CREATE TABLE Customers (
CustomerID BIGINT, 
cName VARCHAR(255), 
cPhone INT, 
eMail VARCHAR(255), 
address VARCHAR(255),
cCity VARCHAR(255),
cState VARCHAR(255),
cCountry VARCHAR(255),
cZip INT
);

CREATE TABLE Invoices (
CustomerID BIGINT, 
InvoiceNum VARCHAR(255), 
iDate DATE, 
VIN VARCHAR(255), 
StaffID VARCHAR(255)
);

CREATE TABLE SalesPersons (
StaffID VARCHAR(255), 
sName VARCHAR(255), 
Store VARCHAR(255)
);