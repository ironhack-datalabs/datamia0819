```mysql
USE lab_mysql;
```
CREATE DATABASE lab_mysql
USE lab_mysql


CREATE TABLE Cars (
	ID BIGINT NOT NULL AUTO_INCREMENT,
	VIN VARCHAR(25),
	Manufacturer VARCHAR(40),
	Model VARCHAR(24),
	Year BIGINT,
	Color VARCHAR(20),
	Primary Key (ID)
);

CREATE TABLE Customer (
    ID INT,
    CustomerID  BIGINT,
    Name_ VARCHAR(255),
    Phone INT,
    Email varchar(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    StateProvince VARCHAR(255),
    Country VARCHAR(255),
    Postal BIgINT,
    PRIMARY KEY (ID)
    );

   CREATE TABLE SalesPersons (
    ID INT,
    StaffID BIGINT,
    NAME_ VARCHAR(50),
    Store VARCHAR(50),
    PRIMARY key (ID)
    ); 

 CREATE TABLE Invoices (
    ID INT,
    Invoice_number BIGINT,
    date_ DATE,
    Car BIGINT,
    Customer INT,
    SalesPerson INT,
    Primary Key (ID),
	FOREIGN KEY (Car) REFERENCES Cars(ID),
    FOREIGN KEY (Customer) REFERENCES Customer(ID),
    FOREIGN KEY (Salesperson) REFERENCES Salespersons(ID)
    );
    
