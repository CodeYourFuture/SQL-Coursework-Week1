/*

1. Show the date, transaction_no, description and amount for those transactions whose amount is between £30,000 and £31,000.
 --------------Answer-------------------
SELECT date,transaction_no, description, amount  FROM spends WHERE amount BETWEEN 30000 AND 31000;
----------------------------------------


2. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee'.
 --------------Answer-------------------
SELECT date, transaction_no, supplier_inv_no, description , amount WHERE description LIKE '%fee%';
----------------------------------------


3. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'Fee'.
 --------------Answer-------------------
SELECT date, transaction_no, supplier_inv_no, description , amount FROM spends WHERE description LIKE '%Fee%';
----------------------------------------



4. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee' (case insensitive). You will need to search 'https://www.postgresql.org/docs/' to solve this.
 --------------Answer-------------------
SELECT date, transaction_no, supplier_inv_no, description , amount FROM spends WHERE lower(description) LIKE '%fee%
----------------------------------------




5. Show the date, transaction_no, supplier_inv_no, 
description and amount for those transactions whose amount is £25,000, £30,000, £35,000 or £40,000.
 --------------Answer-------------------
slow method-
SELECT date, transaction_no, supplier_inv_no, description, amount FROM  spends WHERE amount= 25000 OR amount=30000
OR amount= 35000 OR amount= 40000;
========================================
fast method-
SELECT date, transaction_no, supplier_inv_no, description, amount FROM  spends WHERE amount IN( 2500
0,30000,35000,40000);
----------------------------------------



6. Show the date, the supplier_id, the description and the amount for transactions with the expense area of 'Better Hospital Food'. 
You could do a query to get the expense_area_id first then do a query to find the dates, supplier_ids and amounts. 
But it would be better to do this all in one query by linking the tables together using INNER JOINs.
 --------------Answer-------------------
manaul method-
SELECT * FROM expense_areas WHERE expense_area = 'Better Hospital Food';
SELECT date,supplier_id, description, amount FROM spends WHERE expense_area_id= 2;
========================================
Effective method
SELECT date,supplier_id, description, amount FROM spends
INNER JOIN expense_areas
ON spends.expense_area_id = expense_areas.id
WHERE expense_area = 'Better Hospital Food';
----------------------------------------



7. Show the date, supplier name, description and amount for 
transactions with the expense area of 'Better Hospital Food'. 
You will need to INNER JOIN another table to be able to do this.
 --------------Answer-------------------
SELECT spends.date, expense_areas.expense_area, spends.description, spends.amount FROM spends
INNER JOIN expense_areas ON expense_areas.id=expense_area_id
WHERE expense_areas.id=2;
----------------------------------------



8. We have just received a late invoice for April! 
Add a new row to the spends table:
dated 1st April 2021
with a description of 'Computer Hardware Dell'
transaction number is 38104091 and the supplier's inv no is '3780119655'
the supplier is 'COMPUTACENTER (UK) LTD' (id 16)
the expense type is 'Computer Hardware Purch' (id 7)
the expense area is 'ICT Contingency' (id 18)

 date(01-04-2021),
 description('Computer Hardware Dell'), 
 transaction_no(38104091), 
supplier_inv_no(3780119655),  
supplier_id(16),
 expense_type_id(7) 
 expense_area_id(18)
 amount(32000)
---------------Answer-------------------
INSERT INTO spends (date, description, transaction_no, supplier_id, expense_type_id, supplier_inv_no, expense_area_id, amount) 
VALUES ('01-04-2021','Computer Hardware Dell', 38104091, 16, 7, 2047483647, 18, 32000);   
----------------------------------------



9. If you examine the dates in the data, you will see they all are dated either 1st march 2021 or 1st April 2021. 
So if we group on the the date, there will only be two groups. 
Show the date and the total amount spent on that date 
for these two dates by using a GROUP BY clause.
-------------Answer---------------------
SELECT SUM(amount), date
FROM spends
GROUP BY date;

---------------------------------------
-Changed the titles of the table
SELECT date AS "Month", SUM(amount) AS "Monthly Spend"
FROM spends
GROUP By date;



10. (optional) Great we now know the monthly spend. 
But it didn't look that good. So I've changed my 
SELECT query to output this instead:
   Month    | Monthly Spend 
------------+---------------
 March 2021 | £ 28,674,452
 April 2021 | £ 22,895,194
(2 rows)
Can you work out how to do this?
----------------------------------
-Final answer: Formatted 
SELECT TO_CHAR(date,'FMMonth yyyy') as "Month", 
TO_CHAR(SUM(amount),'£99,999,999') as "Monthly Spend" 
FROM spends GROUP BY date;
----------------------------------

When you have finished all of the questions - open a pull request with your answers to the SQL-Coursework-Week1 repository.
*/   