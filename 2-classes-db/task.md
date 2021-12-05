# Class Database
Run the following command:
```
psql -f setup.sql
```
This will create a database called homework.

It is based on real data from the government found at
https://data.gov.uk/dataset/72eaec8e-0d32-4041-a553-87b852abee64/spend-over-25-000-in-worcestershire-acute-hospitals-nhs-trust

You can work with it by running
```
psql homework
```
## Submission

Below you will find a set of tasks for you to complete to consolidate and extend your learning from this week. You will find it beneficial to complete the reading tasks before attempting some of these.

To submit this homework write the correct commands after each question.

### 1. Show the date, transaction_no, description and amount for those transactions whose amount is between £30,000 and £31,000.
```sql
    SELECT date, transaction_no, description, amount FROM spends WHERE amount BETWEEN 30000 AND 31000;
```
### 2. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee'.
```sql
select date, transaction_no, supplier_inv_no, description, amount
from spends
where description like '%fee%';
```
### 3. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'Fee'.
```sql
SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE description LIKE '%Fee%';
```
### 4. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee' (case insensitive). You will need to search 'https://www.postgresql.org/docs/' to solve this.
```sql

```
### 5. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose amount is £25,000, £30,000, £35,000 or £40,000.
```sql
select date, transaction_no, supplier_inv_no, description, amount
from spends
where amount in('25000','30000','35000', '40000');

```
### 6. Show the date, the supplier_id, the description and the amount for transactions with the expense area of 'Better Hospital Food'. You could do a query to get the expense_area_id first then do a query to find the dates, supplier_ids and amounts. But it would be better to do this all in one query by linking the tables together using INNER JOINs.
```sql
select date, supplier_id, description, amount
from spends
inner join expense_areas  
on spends.expense_area_id = expense_areas.id
where expense_areas.expense_area like '%Better Hospital Food%';
```
### 7. Show the date, supplier name, description and amount for transactions with the expense area of 'Better Hospital Food'. You will need to INNER JOIN another table to be able to do this.
```sql
SELECT spends.date, suppliers.supplier, spends.description, spends.amount, expense_areas.expense_area
    FROM spends
    INNER JOIN suppliers ON spends.supplier_id=suppliers.id
    INNER JOIN expense_areas ON spends.expense_area_id=expense_areas.id
    WHERE expense_areas.expense_area LIKE '%Better Hospital Food%';
```
### 8. We have just received a late invoice for April! Add a new row to the spends table:
    dated 1st April 2021
    with a description of 'Computer Hardware Dell'
    transaction number is 38104091 and the supplier's inv no is '3780119655'
    the supplier is 'COMPUTACENTER (UK) LTD' (id 16)
    the expense type is 'Computer Hardware Purch' (id 7)
    the expense area is 'ICT Contingency' (id 18)
```sql


  INSERT INTO spends (id, expense_type_id, expense_area_id, supplier_id, date, transaction_no, supplier_inv_no, description, amount) 
    VALUES (DEFAULT, 7,18,16,'2021-04-01',38104091,3780119655,'Computer Hardware Dell', 0);
```
### 9. If you examine the dates in the data, you will see they all are dated either 1st march 2021 or 1st April 2021. So if we group on the the date, there will only be two groups. Show the date and the total amount spent on that date for these two dates by using a GROUP BY clause.
```sql
select sum(amount),date
from spends 
group by date;
```
### 10. (optional) Great we now know the monthly spend. But it didn't look that good. So I've changed my SELECT query to output this instead:
```
   Month    | Monthly Spend 
------------+---------------
 March 2021 | £ 28,674,452
 April 2021 | £ 22,895,194
(2 rows)
```
Can you work out how to do this?

```sql
select to_char(date::date,'Month yyyy')as "Month", to_char(sum(amount),'£ 00,000,000')as "Monthly Spend"
from spends group by date;
```

When you have finished all of the questions - open a pull request with your answers to the `SQL-Coursework-Week1` repository.
