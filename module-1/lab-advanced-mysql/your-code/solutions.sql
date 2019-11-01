#Challege 1
#STEP 1 : Calculate the royalties of each sales for each author
#Use this formula : sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100

SELECT titles.title, titles.title_id, authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName ,titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
JOIN sales ON titles.title_id = sales.title_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id

#STEP 2 : Aggregation of Royalites by title and author
#Use the *SUM* subquery and group by both `au_id` and `title_id`

SELECT titles.title, titles.title_id, authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName ,titles.price * SUM(sales.qty) * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
FROM titles
JOIN sales ON titles.title_id = sales.title_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY au_id, title_id;

#STEP 3 : Calculation of Total Profit per Author
#Aggregate the advance and royalites for each title, sort High/Lo, Limit 3

SELECT authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName , titles.advance + titles.price * SUM(sales.qty) * titles.royalty / 100 * titleauthor.royaltyper / 100 as total_profit
FROM titles
JOIN sales ON titles.title_id = sales.title_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id
GROUP BY au_id
ORDER BY total_profit DESC
LIMIT 3
 
#Challenge 2 - Alt Solution
#Using Temp tables
#Step 1 - Creation of royalty_summary
CREATE TEMPORARY TABLE publications.royalty_summary
SELECT titles.title_id, authors.au_id, authors.au_lname as LastName, authors.au_fname as FirstName ,titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty, titles.advance
FROM titles
JOIN sales ON titles.title_id = sales.title_id
JOIN titleauthor ON titles.title_id = titleauthor.title_id
JOIN authors ON titleauthor.au_id = authors.au_id;

#Step 2 - Aggregation of royalites by title and author

SELECT royalty_summary.title_id, royalty_summary.au_id, sum(royalty_summary.sales_royalty) as AggregateRoyalty, royalty_summary.advance
FROM publications.royalty_summary 
Group by title_id, au_id;

#Step 3 - Calculation of total profit/author
#Creation of aggregate_royalty

CREATE TEMPORARY TABLE publications.aggregate_royalty
SELECT royalty_summary.title_id, royalty_summary.au_id, sum(royalty_summary.sales_royalty) as AggregateRoyalty, royalty_summary.advance
FROM publications.royalty_summary 
Group by title_id, au_id;

#Total Profit Query

SELECT aggregate_royalty.au_id, AggregateRoyalty + aggregate_royalty.advance as TotalProfit
from aggregate_royalty
GROUP BY au_id
ORDER BY TotalProfit DESC
LIMIT 3

#Challenge 3 - Most_Profiting_Authors

Create Table Most_Profiting_Authors
SELECT aggregate_royalty.au_id, AggregateRoyalty + aggregate_royalty.advance as TotalProfit
from aggregate_royalty
GROUP BY au_id
ORDER BY TotalProfit DESC
LIMIT 3





