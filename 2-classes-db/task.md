# Class Database
Run the following commands:
```
createdb homework
psql -d homework -f setup.sql
```
This will create and populate a database called homework.

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
select date, transaction_no, description, amount from spends where amount > 30000 and amount < 31000;

```
### 2. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee'.
```sql
select date, transaction_no, supplier_inv_no, description, amount from spends where description like '%fee%';
 date    | transaction_no | supplier_inv_no |                          description                           | amount 
------------+----------------+-----------------+----------------------------------------------------------------+--------
 2021-03-01 |       37574010 | PML0051         | Agreement fee as set out in the Report for the Settlement Deed |  51113
 2021-04-01 |       37788824 | I000039418P     | Recruitment fee for international nurses                       |  34800
 2021-04-01 |       37828209 | 11829           | DAF - Professional fees                                        | 300000
(3 rows)


```
### 3. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'Fee'.
```sql
 select date, transaction_no, supplier_inv_no, description, amount from spends where description like '%Fee%';
    date    | transaction_no | supplier_inv_no |     description      | amount 
------------+----------------+-----------------+----------------------+--------
 2021-03-01 |       37600517 | I000038387P     | Overseas Nurses Fees |  34800
 2021-03-01 |       37750117 | T034177         | Consultant Fees      |  74996
 2021-03-01 |       37726776 | T034397         | Consultant Fees      | 461861
 2021-03-01 |       37669018 | T034456         | Consultant Fees      | 646944
 2021-03-01 |       37788777 | T034567         | Consultant Fees      | 423270
 2021-04-01 |       38014054 | 42914332        | Annual Fee           | 319646
(6 rows)

```
### 4. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose description includes the word 'fee' (case insensitive). You will need to search 'https://www.postgresql.org/docs/' to solve this.
```sql
select date, transaction_no, supplier_inv_no, description, amount from spends where lower(description) like '%fee%';
 date    | transaction_no | supplier_inv_no |                          description                           | amount 
------------+----------------+-----------------+----------------------------------------------------------------+--------
 2021-03-01 |       37600517 | I000038387P     | Overseas Nurses Fees                                           |  34800
 2021-03-01 |       37574010 | PML0051         | Agreement fee as set out in the Report for the Settlement Deed |  51113
 2021-03-01 |       37750117 | T034177         | Consultant Fees                                                |  74996
 2021-03-01 |       37726776 | T034397         | Consultant Fees                                                | 461861
 2021-03-01 |       37669018 | T034456         | Consultant Fees                                                | 646944
 2021-03-01 |       37788777 | T034567         | Consultant Fees                                                | 423270
 2021-04-01 |       37788824 | I000039418P     | Recruitment fee for international nurses                       |  34800
 2021-04-01 |       37828209 | 11829           | DAF - Professional fees                                        | 300000
 2021-04-01 |       38014054 | 42914332        | Annual Fee                                                     | 319646
(9 rows)

```
### 5. Show the date, transaction_no, supplier_inv_no, description and amount for those transactions whose amount is £25,000, £30,000, £35,000 or £40,000.
```sql
select date, transaction_no, supplier_inv_no, description, amount from spends where amount = 25000 or amount = 30000 or amount = 35000 or amount = 40000;
    date    | transaction_no | supplier_inv_no |                    description                    | amount 
------------+----------------+-----------------+---------------------------------------------------+--------
 2021-03-01 |       37588987 | 11716           | Waste Volume                                      |  25000
 2021-03-01 |       37698700 | 11795           | Waste Volume                                      |  25000
 2021-03-01 |       37520209 | INV4131         | Site surveys and weekly design/Progress Meetings. |  25000
 2021-04-01 |       37801641 | 305719          | Fire Alarm Infrastructure Replacement             |  25000
 2021-04-01 |       37854035 | 3780119745      | CALL OFF PO - REMOTE ACCESS                       |  30000
 2021-04-01 |       38059452 | 7032500381      | Recharge of intersystems                          |  40000
(6 rows)

```
### 6. Show the date, the supplier_id, the description and the amount for transactions with the expense area of 'Better Hospital Food'. You could do a query to get the expense_area_id first then do a query to find the dates, supplier_ids and amounts. But it would be better to do this all in one query by linking the tables together using INNER JOINs.
```sql
select spends.date, spends.supplier_id, spends.description, spends.amount from spends INNER JOIN expense_areas ON spends.expense_area_id = expense_areas.id where expense_areas.expense_area = 'Better Hospital Food';
    date    | supplier_id |         description         | amount 
------------+-------------+-----------------------------+--------
 2021-03-01 |          61 | Meals Volume                | 105000
 2021-03-01 |          61 | Meals Additional Variations |  32558
 2021-03-01 |          61 | Meals Volume                | 100000
(3 rows)

```
### 7. Show the date, supplier name, description and amount for transactions with the expense area of 'Better Hospital Food'. You will need to INNER JOIN another table to be able to do this.
```sql
select spends.date, suppliers.supplier, spends.description, spends.amount from spends INNER JOIN expense_areas ON spends.expense_area_id = expense_areas.id INNER JOIN suppliers ON spends.supplier_id = suppliers.id where expense_areas.expense_area = 'Better Hospital Food';
    date    |            supplier             |         description         | amount 
------------+---------------------------------+-----------------------------+--------
 2021-03-01 | WORCESTERSHIRE HOSPITAL SPC PLC | Meals Volume                | 105000
 2021-03-01 | WORCESTERSHIRE HOSPITAL SPC PLC | Meals Additional Variations |  32558
 2021-03-01 | WORCESTERSHIRE HOSPITAL SPC PLC | Meals Volume                | 100000
(3 rows)

```
### 8. We have just received a late invoice for April! Add a new row to the spends table:
    dated 1st April 2021
    with a description of 'Computer Hardware Dell'
    transaction number is 38104091 and the supplier's inv no is '3780119655'
    the supplier is 'COMPUTACENTER (UK) LTD' (id 16)
    the expense type is 'Computer Hardware Purch' (id 7)
    the expense area is 'ICT Contingency' (id 18)
    for £32,000.
```sql

```
### 9. If you examine the dates in the data, you will see they all are dated either 1st march 2021 or 1st April 2021. So if we group on the the date, there will only be two groups. Show the date and the total amount spent on that date for these two dates by using a GROUP BY clause.
```sql

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

```

When you have finished all of the questions - open a pull request with your answers to the `SQL-Coursework-Week1` repository.
