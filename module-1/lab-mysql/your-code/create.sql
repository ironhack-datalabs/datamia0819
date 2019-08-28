CREATE DATABASE lab_mysql;
USE lab_mysql;

DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS salespersons;
DROP TABLE IF EXISTS stores;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS cars;

CREATE TABLE customers (
    id BIGINT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	phone_number VARCHAR(20),
	email VARCHAR(100),
	address VARCHAR(255),
	city VARCHAR(50),
	state VARCHAR(50),
	country VARCHAR(50),
	zip_code INT,
    PRIMARY KEY (id)
);
CREATE TABLE stores(
	id BIGINT NOT NULL AUTO_INCREMENT,
    city VARCHAR(20),
    country VARCHAR(20),
    PRIMARY KEY (id)
);
CREATE TABLE salespersons (
    id BIGINT NOT NULL AUTO_INCREMENT,
	staff_id VARCHAR(20) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
    store_id BIGINT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (store_id) REFERENCES stores(id)
);
CREATE TABLE cars (
    id BIGINT NOT NULL AUTO_INCREMENT,
	vin CHAR(17),
	manufacturer VARCHAR(50),
	model VARCHAR(20),
	year INT,
	color VARCHAR(20),
    PRIMARY KEY (id)
);
CREATE TABLE invoices (
    id BIGINT(100) NOT NULL AUTO_INCREMENT,
    number INT(20),
	date DATETIME,
	car_id BIGINT(100),
	customer_id BIGINT(100),
	salesperson_id BIGINT(100),
    PRIMARY KEY (id),
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (salesperson_id) REFERENCES salespersons(id)
);