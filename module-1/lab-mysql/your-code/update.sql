USE lab_mysql;

select * from salespersons;
-- Salespersons table update city as Miami for Paige turner
UPDATE salespersons
SET Store = 'Miami'
WHERE Name_ = 'Paige Turner';

select * from customer;

UPDATE customer
SET Email = 'ppicasso@gmail.com'
WHERE Name_= 'Pablo Picasso';

UPDATE customer
SET Email = 'lincoln@us.gov'
WHERE Name_= 'Abraham Lincoln';

UPDATE customer
SET Email = ' hello@napoleon.me'
WHERE NAME_ = 'Napoléon Bonaparte';

