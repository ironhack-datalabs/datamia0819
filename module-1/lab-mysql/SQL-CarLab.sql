use example;
INSERT INTO cars (VIN, Manufacturer, Model, ModelYear, Color)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO cars (VIN, 
Manufacturer, 
Model, 
ModelYear, 
Color
)
VALUES
(
'ZM8G7BEUQZ97IH46V' ,
'Peugeot' ,
'Rifter',
 '2019',
 'Red'
),
(
'RKXVNNIHLVVZOUB4M' ,
'Ford' ,
'Fusion' 	,
'2018' ,
'White'
),
(
'HKNDGS7CU31E9Z7JW' ,
'Toyota', 
'RAV4',
 '2018' ,
'Silver'
),
(
'DAM41UDN3CHU2WVF6' ,
'Volvo',
 'V60', 
'2019' ,
'Gray'
),
(
'DAM41UDN3CHU2WVF7' ,
'Volvo',
 'V60 Cross Country' ,
'2019',	
'Gray'
);

INSERT INTO customers (CustomerID,
LastName,
FirstName,
PhoneNumber,
Address,
City,
State,
Country,
ZipCode
)
VALUES
(
'10001',
'Picasso',
'Pablo',
'+34 636 17 63 82',
'Paseo de la Chopera, 14',
'Madrid',
'Madrid',
'Spain',
'28045'
),
(
'20001',
'Lincoln',
'Abraham' ,
'+1 305 907 7086',
'120 SW 8th St',
'Miami',
'Florida',
'United States',
'33130'
),
(
'30001',
'Bonaparte' ,
'Napoléon' ,	
'+33 1 79 75 40 00' ,
'40 Rue du Colisée',
'Paris',
'Île-de-France' ,
'France',
'75008'
);
INSERT INTO salespersons (StaffID, LastName, FirstName, Store)
VALUES ('00001', 'Cruiser', 'Petey', 'Madrid'),
('00002', 'Sthesia', 'Anna', 'Barcelona'),
('00003', 'Molive', 'Paul', 'Berlin'),
('00004', 'Forcewind', 'Gail', 'Paris'),
('00005', 'Turner', 'Paige', 'Mimia'),
('00006', 'Frapples', 'Bob', 'Mexico City'),
('00007', 'Melon', 'Walter', 'Amsterdam'),
('00008', 'Leer', 'Shonda', 'Sao Paulo');
INSERT INTO invoices (InvoiceNumber, SaleDate, VIN, CustomerID, Salesperson)
VALUES ('852399038', '22-08-2018', '3K096I98581DHSNUP', '20001', '00004'),
('731166526', '31-12-2018', 'HKNDGS7CU31E9Z7JW', '10001', '00006'),
('271135104', '22-01-2019', 'RKXVNNIHLVVZOUB4M', '20001', '00008');

UPDATE customers
SET Email = CASE CustomerID
    WHEN '10001' THEN 'ppicasso@gmail.com'
    WHEN '20001' THEN 'lincoln@us.gov'
    WHEN '30001' THEN 'hello@napoleon.me'
    ELSE Email
    END
WHERE CustomerID IN ('10001', '20001', '30001');