DROP TABLE Invoices;
DROP TABLE Cars;
DROP TABLE Salesperson;
DROP TABLE Customers;
CREATE TABLE Cars (
	ID BIGINT NOT NULL AUTO_INCREMENT,
	VIN VARCHAR(18),
	Manufacturer VARCHAR(20),
	Model VARCHAR(20),
	Year CHAR(4),
	Color VARCHAR(20),
	Primary Key (ID)
);
CREATE TABLE Salesperson (
	ID BIGINT NOT NULL AUTO_INCREMENT,
	Staff_ID VARCHAR(10),
	Name VARCHAR(40),
	Store_city VARCHAR(20),
	Primary Key (ID)
);
CREATE TABLE Customers (
    ID BIGINT NOT NULL AUTO_INCREMENT,
	 Name VARCHAR(255),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Country VARCHAR(50),
    Zip_Code INT,
    PRIMARY KEY (id)
);
CREATE TABLE Invoices(
	Invoice_ID int NOT NULL AUTO_INCREMENT,
	Salesperson_ID BIGINT(100),
	Date DATETIME,
	Cust_ID BIGINT(100),
	Car_ID BIGINT(100),
	Primary Key (Invoice_ID),
	FOREIGN KEY (Car_ID) REFERENCES Cars(ID),
    FOREIGN KEY (Cust_ID) REFERENCES Customers(ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(ID)
);