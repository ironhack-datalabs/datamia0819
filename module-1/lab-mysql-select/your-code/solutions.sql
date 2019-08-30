##1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors 
Inner JOIN titleauthor ON authors.au_id = titleauthor.au_id
	  JOIN titles ON titleauthor.title_id = titles.title_id
	  JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id;



###1 repeat
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM authors 
Inner JOIN titleauthor ON authors.au_id = titleauthor.au_id
	  JOIN titles ON titleauthor.title_id = titles.title_id
	  JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_lname;

#2
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


