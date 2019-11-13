-- Challenge 1 
SELECT 
	authors.au_id 'Author ID' 
	,au_lname 'Last Name'
    ,au_fname 'First Name'
    ,titles.title 'Title'
    ,publishers.pub_name 'Publisher'
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id;

-- Challenge 2
SELECT
	authors.au_id 'Author ID'
	,au_lname 'Last Name'
	,au_fname 'First Name'
	,publishers.pub_name 'Publisher'
	,COUNT(titles.title_id) 'Number or Titles'
	FROM authors 
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, publishers.pub_name

-- Challenge 3 
SELECT
	authors.au_id 'Author ID'
	,au_lname 'Last Name'
	,au_fname 'First Name'
	,SUM(ytd_sales) 'Total'
	FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(ytd_sales) DESC LIMIT 3

-- Challenge 4 
SELECT
	authors.au_id 'Author ID'
	,au_lname 'Last Name'
	,au_fname 'First Name'
	,CASE WHEN SUM(ytd_sales) IS NULL THEN 0 ELSE SUM(ytd_sales) END 'Total'
	FROM authors
LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
LEFT JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY SUM(ytd_sales) DESC;

-- Bonus
SELECT 
	authors.au_id 'Author ID'
	,au_lname 'Last Name'
	,au_fname 'First Name'
	,ROUND(SUM((advance * ( royaltyper / 100)) + (((ytd_sales * price) * royalty/100) *( royaltyper / 100)))) 'Profit'
	FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY Profit DESC LIMIT 3;