-- Challenge 1
SELECT SUM(titles.price * (titles.royalty / 100) * (titleauthor.royaltyper / 100) * titles.ytd_sales + titles.advance) as TotalProfit, authors.au_id as Authors_id, authors.au_lname as LastName, authors.au_fname as FirstName
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on titles.pub_id = publishers.pub_id
Group by authors.au_id
Order by TotalProfit DESC
limit 3

-- Challenge 2

DROP TABLE publications.author_sales1;
CREATE TABLE publications.author_sales1
SELECT
    authors.au_id
    ,price
    ,ytd_sales
    ,royalty
    ,advance
    ,royaltyper
    ,'Profit'
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id;

SELECT
    au_id 'Author ID'
    ,ROUND(SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100), 2) 'Profit'
FROM author_sales1
GROUP BY
    au_id
ORDER BY
    SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100) DESC
LIMIT 3

/* -- Challenge 3
Create Table most_profiting_authors(
Authorid varchar(255),
Profits varchar (255)) */
DROP TABLE if exists most_profiting_authors;
CREATE table most_profiting_authors 
SELECT SUM(titles.price * (titles.royalty / 100) * (titleauthor.royaltyper / 100) * titles.ytd_sales + titles.advance) as TotalProfit, authors.au_id as Authors_id 
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on titles.pub_id = publishers.pub_id
Group by authors.au_id
Order by TotalProfit DESC
