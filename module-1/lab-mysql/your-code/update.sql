UPDATE stores
SET city = 'Miami'
WHERE id = 5;

UPDATE customers
SET email = CASE id
	WHEN 1 THEN 'ppicasso@gmail.com'
    WHEN 2 THEN 'lincoln@us.gov'
    WHEN 3 THEN 'hello@napoleon.me'
    ELSE email
    END
WHERE id IN (1, 2, 3);