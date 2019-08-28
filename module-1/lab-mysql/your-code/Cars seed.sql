INSERT INTO cars (VIN,Manufacturer,Model,ModYear,Color) VALUES ('BLA41DUN6RTB2WIO6','VW','Golf','2016','Grey');
INSERT INTO cars (VIN,Manufacturer,Model,ModYear,Color) VALUES ('CIP41FOE6RTB2WIO9','VW','Golf','2014','White');
INSERT INTO cars (VIN,Manufacturer,Model,ModYear,Color) VALUES ('OOC41FUL6RTB2QRO9','VW','GLI','2019','Blue');
INSERT INTO cars (VIN,Manufacturer,Model,ModYear,Color) VALUES ('BUR41RRO6RTB2EZ44','VW','Passat','2018','Black');
INSERT INTO cars (VIN,Manufacturer,Model,ModYear,Color) VALUES ('CRE41MEO6RTB2MQ88','VW','Beetle','1964','SkyBlue');

CREATE TABLE Cars (
VIN VARCHAR(255), 
Manufacturer VARCHAR(255), 
Model VARCHAR(255), 
ModYear INT, 
Color VARCHAR(255)
);

select * from cars