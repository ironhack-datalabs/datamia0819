DROP TABLE Cars;
DROP TABLE Invoices;
DROP TABLE Salesperson;
DROP TABLE Customers;

CREATE TABLE Invoices(
	Invoice_ID VARCHAR(20),
	Staff_ID CHAR(5),
	Date DATETIME,
	Cust_ID VARCHAR(10),
	VIN VARCHAR(10),
	Primary Key (Invoice_ID)
);

CREATE TABLE Cars (
	ID int NOT NULL AUTO_INCREMENT,
	VIN VARCHAR(18),
	Manufacturer VARCHAR(20),
	Model VARCHAR(20),
	Year CHAR(4),
	Color VARCHAR(20),
	Primary Key (ID)
);

CREATE TABLE Salesperson (
	ID int NOT NULL AUTO_INCREMENT,
	Staff_ID VARCHAR(10),
	Name VARCHAR(40),
	Store_city VARCHAR(20),
	Primary Key (ID)
);

CREATE TABLE Customers (
	ID int NOT NULL AUTO_INCREMENT,
	Cust_ID VARCHAR(10),
	Name VARCHAR(40),
	Phone VARCHAR(20),
	Address VARCHAR(40),
	City VARCHAR(20),
	State VARCHAR(30),
	Country VARCHAR(20),
	Zip_Code CHAR(5),
	Primary Key (ID)

);


