#CHALLENGE 1
#using derived tables

#Step 1: Calculate the royalties of each sales for each author
SELECT titles.title_id, authors.au_id, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
from authors
join titleauthor
on authors.au_id = titleauthor.au_id
join titles
on titleauthor.title_id = titles.title_id
join sales
on titles.title_id = sales.title_id
order by sales_royalty desc

# Step 2: Aggregate the total royalties for each title for each author
Select SUM(sales_royalty) as royalty1, au_id, title_id from (
	SELECT titles.title_id, authors.au_id, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
	from authors
	join titleauthor
	on authors.au_id = titleauthor.au_id
	join titles
	on titleauthor.title_id = titles.title_id
	join sales
	on titles.title_id = sales.title_id
	order by sales_royalty desc
	)  as tt 
group by au_id, title_id;

#Step 3: Calculate the total profits of each author
Select titles.advance + t2.royalty1 as profits, t2.au_id from (
	Select SUM(sales_royalty) as royalty1, au_id, title_id from (
		SELECT titles.title_id, authors.au_id, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
		from authors
		join titleauthor
		on authors.au_id = titleauthor.au_id
		join titles
		on titleauthor.title_id = titles.title_id
		join sales
		on titles.title_id = sales.title_id
		order by sales_royalty desc
		)  as t1
	group by au_id, title_id) as t2
join titles 
on titles.title_id = t2.title_id
order by profits desc limit 3;


# CHALLENGE 2 - Alternative Solution
#Using temp tables

#Step 1: Calculate the royalties of each sales for each author
CREATE TEMPORARY TABLE step1
SELECT titles.title_id, authors.au_id, titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100 as sales_royalty
		from authors
		join titleauthor
		on authors.au_id = titleauthor.au_id
		join titles
		on titleauthor.title_id = titles.title_id
		join sales
		on titles.title_id = sales.title_id
		order by sales_royalty desc;

# Step 2: Aggregate the total royalties for each title for each author
CREATE TEMPORARY TABLE step2
Select SUM(sales_royalty) as royalty1, au_id, title_id
from step1
group by au_id, title_id; 

#Step 3: Calculate the total profits of each author
Select titles.advance + step2.royalty1 as profits, step2.au_id 
from step2
join titles 
on titles.title_id = step2.title_id
order by profits desc limit 3;

#CHALLENGE 3- Create permanent table with output of challenge 1 or 2 (both same).
CREATE TABLE most_profitting_authors
Select titles.advance + step2.royalty1 as profits, step2.au_id 
from step2
join titles 
on titles.title_id = step2.title_id
order by profits desc limit 3;











