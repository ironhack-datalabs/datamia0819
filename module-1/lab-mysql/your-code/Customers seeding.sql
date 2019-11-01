INSERT INTO customers (CustomerID,cName,cPhone,eMail,address,cCity,cState,cCountry,cZip) VALUES ('9383432','Name1','305872235','asdf@asdf.com','111 st','city1','state1','country1','664233');
INSERT INTO customers (CustomerID,cName,cPhone,eMail,address,cCity,cState,cCountry,cZip) VALUES ('7542432','Name2','834982232','asjk@asdf.com','222 st','city2','state2','country2','884232');
INSERT INTO customers (CustomerID,cName,cPhone,eMail,address,cCity,cState,cCountry,cZip) VALUES ('9983542','Name3','505982931','asbd@asdf.com','333 st','city3','state3','country3','994234');
INSERT INTO customers (CustomerID,cName,cPhone,eMail,address,cCity,cState,cCountry,cZip) VALUES ('8233432','Name4','999982235','aswe@asdf.com','444 st','city4','state4','country4','224232');
INSERT INTO customers (CustomerID,cName,cPhone,eMail,address,cCity,cState,cCountry,cZip) VALUES ('1383123','Name5','666982236','asas@asdf.com','555 st','city5','state5','country5','724236');

-- INSERT INTO customers (CustomerID,cName,cPhone,eMail,address,cCity,cState,cCountry,cZip) VALUES(
-- '93834325212345678903','Name1','30588727235','asdf@asdf.com','kjhgfdfghjk','city1','state1','country1','66423535163'
-- '75424324126348924567','Name2','83489827232','asjk@asdf.com','jhgfghjkkkk','city2','state2','country2','88423123562'
-- );

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

select * from customers