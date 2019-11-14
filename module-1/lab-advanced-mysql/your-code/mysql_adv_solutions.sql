
-- SQL Avanced Lab
-- Step1
CREATE TEMPORARY TABLE Temp1
SELECT
	titles.title_id 'TitleID'
	,au_id 'AuthorID'
	,ROUND(((titles.price * sales.qty) * (titles.royalty / 100)) * (titleauthor.royaltyper / 100)) 'SalesRoyalty'
	FROM 
	titles
JOIN sales ON sales.title_id = titles.title_id
JOIN titleauthor ON titleauthor.title_id = titles.title_id;

-- Step2
CREATE TEMPORARY TABLE Temp2
SELECT 
	TitleID
	,AuthorID
	,SUM(SalesRoyalty) 'SumRoyalty'
FROM Temp1
GROUP BY AuthorID, TitleID;

-- Step 3
CREATE TABLE publications.most_profiting_authors
SELECT 
	AuthorID
	,ROUND(SUM((titles.advance * (titleauthor.royaltyper/100)) + SumRoyalty), 2) 'TotalRoyalty'
FROM Temp2
JOIN titleauthor ON titleauthor.au_id = Temp2.AuthorID
JOIN titles ON titles.title_id = titleauthor.title_id
GROUP BY AuthorID
ORDER BY TotalRoyalty DESC LIMIT 3;
