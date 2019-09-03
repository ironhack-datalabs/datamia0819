##1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors 
Inner JOIN titleauthor ON authors.au_id = titleauthor.au_id
	  JOIN titles ON titleauthor.title_id = titles.title_id
	  JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id;


#2
SELECT authors.au_id, authors.au_fname as "first", authors.au_lname as "last", count(titles.title) as title_count, publishers.pub_name as publisher
FROM authors
join titleauthor
on authors.au_id = `titleauthor`.au_id
join titles
on titleauthor.title_id = titles.title_id
join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
Order by authors.au_id desc;

#3
SELECT authors.au_id as au_id,  authors.au_lname as last, authors.au_fname as first, sum(sales.qty) as total
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join sales
on titleauthor.title_id = sales.title_id
group by au_id
order by total desc limit 3;

#4
SELECT authors.au_id as au_id,  authors.au_lname as last, authors.au_fname as first, ifnull(sum(sales.qty),0) as total
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join sales
on titleauthor.title_id = sales.title_id
group by au_id
order by total desc;

