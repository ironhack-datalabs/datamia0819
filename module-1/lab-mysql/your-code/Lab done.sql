-- Challange 1

select authors.au_id as Authors_id, au_lname as Last_name, au_fname as first_name, titles.title as Title, publishers.pub_name as Publisher
from authors
inner join titleauthor on authors.au_id = titleauthor.au_id
inner join titles on titles.title_id = titleauthor.title_id 
inner join publishers on publishers.pub_id = titles.pub_id
;

-- Challange 2
select authors.au_id as Authors_id, au_lname as Last_name, au_fname as first_name, publishers.`pub_name` AS Publishers, count(titles.`title_id`) as COUNTS
from authors
right join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titleauthor.`title_id` = titles.`title_id`
left join publishers on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
; 

-- Challange 3
SELECT authors.au_id as Authors_id, authors.au_lname as lastName, authors.au_fname as FirstName, SUM(titles.ytd_sales) as TitleSales
from authors 
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY TitleSales DESC
limit 3

-- Challange 4 

SELECT authors.au_id as authors_id, authors.au_lname as LastName, authors.au_fname as FirstName, SUM(titles.ytd_sales) as TitleSales
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY TitleSales DESC


-- Bonus

SELECT SUM(titles.price * (titles.royalty / 100) * titles.ytd_sales + titles.advance) as TotalProfit, authors.au_id as Authors_id, authors.au_lname as LastName, authors.au_fname as FirstName
from authors
join titleauthor on authors.au_id = titleauthor.au_id
join titles on titles.title_id = titleauthor.title_id
join publishers on titles.pub_id = publishers.pub_id
Group by authors.au_id
Order by TotalProfit DESC
limit 3





