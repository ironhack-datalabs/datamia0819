USE publications;
SELECT *FROM AUTHORS;

-- Challenge 1 :Who have published what at where?
SELECT authors.au_id AS AuthorID, authors.au_lname AS LastName,
 authors.au_fname as FirstName, titles.title as Title, publishers.pub_name as Publisher 
FROM authors 
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY AuthorID ;

-- Challenge 2 Who Have Published How Many At Where?;
SELECT  authors.au_id as AuthorID,authors.au_lname as LastName,au_fname as FirstName,
 count(titles.title_id) as NumberOfTitles, publishers.pub_name as Publisher
 from authors
 join titleauthor on authors.au_id = titleauthor.au_id
 join titles on titleauthor.title_id = titles.title_id
 JOIN publishers ON titles.pub_id = publishers.pub_id
 group by authors.au_id, publishers.pub_name
Order by authors.au_id desc;

-- Challenge 3  Best Selling Authors
SELECT authors.au_id as AuthorID,  authors.au_lname as LastName, authors.au_fname as FirstName, count(titles.ydtsales) as Total
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join sales on titleauthor.title_id = titles.title_id
group by AuthorID
order by total desc limit 3;

## Challenge 4 - Best Selling Authors Ranking

select authors.au_id as AuthorID,  authors.au_lname as LastName, authors.au_fname as FirstName,
ifnull(sum(sales.qty),0) as Total
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join sales on titleauthor.title_id = sales.title_id
group by AuthorID
order by total desc ;
 
 select * from authors;