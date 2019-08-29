USE publications;

DROP TABLE IF EXISTS author_sales;

-- challenge 1
CREATE TEMPORARY TABLE publications.author_sales
SELECT
    authors.au_id
    ,price
    ,ytd_sales
    ,royalty
    ,advance
    ,royaltyper
FROM authors
JOIN titleauthor ON titleauthor.au_id = authors.au_id
JOIN titles ON titles.title_id = titleauthor.title_id;

SELECT
    au_id 'Author ID'
    ,ROUND(SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100), 2) 'Profit'
FROM author_sales
GROUP BY
    au_id
ORDER BY
	SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100) DESC
LIMIT 3

-- challenge 2
SELECT
    au_id 'Author ID'
    ,ROUND(SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100), 2) 'Profit'
FROM (
	SELECT
		authors.au_id
		,price
		,ytd_sales
		,royalty
		,advance
		,royaltyper
	FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
	JOIN titles ON titles.title_id = titleauthor.title_id
) author_sales
GROUP BY
    au_id
ORDER BY
	SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100) DESC
LIMIT 3

-- challenge 3
CREATE TABLE publications.most_profiting_authors
SELECT
    au_id 'Author ID'
    ,ROUND(SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100), 2) 'Profit'
FROM (
	SELECT
		authors.au_id
		,price
		,ytd_sales
		,royalty
		,advance
		,royaltyper
	FROM authors
	JOIN titleauthor ON titleauthor.au_id = authors.au_id
	JOIN titles ON titles.title_id = titleauthor.title_id
) author_sales
GROUP BY
    au_id
ORDER BY
	SUM((price * ytd_sales * royalty / 100 + advance) * royaltyper / 100) DESC
LIMIT 3;