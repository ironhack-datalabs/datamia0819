```mysql
USE lab_mysql;
```


CREATE TABLE Car (
    VIN INT,
    carmodel VARCHAR(255),
    make VARCHAR(255),
    Price FLOAT,
    year INT,
    color VARCHAR(255)
);
CREATE TABLE Customer (
    ID INT,
    full_name VARCHAR(255),
    cell_num INT,
    email_id varchar(255),
    address VARCHAR(255)
    );
   CREATE TABLE SalesPerson (
    ID INT,
    full_name VARCHAR(255),
    cell_num INT,
    email_id varchar(255),
    store_name VARCHAR(255)
    ); 
    CREATE TABLE Invoices (
    number BIGINT,
    date DATE,
    customer_id INT,
    Salesperson_id INT,
    cutomer_id INT,
    car_name VARCHAR(255)
    );
    
