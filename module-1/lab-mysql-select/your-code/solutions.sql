use publications

select authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName, titles.title as Title, publishers.pub_name as Publisher
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titles.title_id = titleauthor.title_id
join publishers
on titles.pub_id = publishers.pub_id

SELECT authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName, count(titles.title) as TitleCount, publishers.pub_name as Publisher
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON
titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id

SELECT authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName, SUM(titles.ytd_sales) as TitleSales
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY TitleSales DESC
LIMIT 3


# Not sure how to get 23 in stead of 24 rows. My duplicate author is A. Ringer
SELECT authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName, COALESCE(titles.ytd_sales, 0) as TitleSales
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titles.title_id = titleauthor.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
ORDER BY TitleSales DESC

# review
SELECT SUM(titles.price * (titles.royalty / 100) * titles.ytd_sales + titles.advance) as TotalProfit, authors.au_id as Authors_id, authors.au_lname as LastName, authors.au_fname as FirstName
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
Group by authors.au_id
Order by TotalProfit DESC
limit 3
