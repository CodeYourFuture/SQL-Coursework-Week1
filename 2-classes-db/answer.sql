-- ### 1. Show the date, transaction_no, description and 
-- amount for those transactions whose amount is between £30,000 and £31,000.
SELECT date,
    transaction_no,
    description,
    amount
FROM spends
WHERE amount >= 30000
    AND amount <= 31000;
-- OR    
SELECT date,
    transaction_no,
    description,
    amount
FROM spends
WHERE amount BETWEEN 30000 AND 31000;
-- ### 2. Show the date, transaction_no, supplier_inv_no, 
-- description and amount for those transactions whose description includes the word 'fee'.
SELECT date,
    transaction_no,
    supplier_inv_no,
    description,
    amount
FROM spends
WHERE description LIKE '%fee%';
-- ### 3. Show the date, transaction_no, supplier_inv_no, description and amount for those 
-- transactions whose description includes the word 'Fee'.
SELECT date,
    transaction_no,
    supplier_inv_no,
    description,
    amount
from spends
WHERE description LIKE '%Fee%';
-- ### 4. Show the date, transaction_no, supplier_inv_no, description and amount for those 
-- transactions whose description includes the word 'fee' (case insensitive). You will need 
-- to search 'https://www.postgresql.org/docs/' to solve this.
-- xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
-- both below works, according to stackoverflow, lower() LIKE has faster access to tables than ILIKE
SELECT date,
    transaction_no,
    supplier_inv_no,
    description,
    amount
FROM spends
WHERE lower(description) LIKE '%fee%';
-- OR
SELECT date,
    transaction_no,
    supplier_inv_no,
    description,
    amount
FROM spends
WHERE description ILIKE '%fee%';
-- ### 5. Show the date, transaction_no, supplier_inv_no, description and amount for those 
-- transactions whose amount is £25,000, £30,000, £35,000 or £40,000.
SELECT date,
    transaction_no,
    supplier_inv_no,
    description,
    amount
FROM spends
WHERE amount IN (25000, 30000, 35000, 40000);
-- ### 6. Show the date, the supplier_id, the description and the amount for transactions 
-- with the expense area of 'Better Hospital Food'. You could do a query to get the 
-- expense_area_id first then do a query to find the dates, supplier_ids and amounts. But it 
-- would be better to do this all in one query by linking the tables together using INNER JOINs.
SELECT date,
    supplier_id,
    description,
    amount
from spends
    INNER JOIN expense_areas ON spends.expense_area_id = expense_areas.id
WHERE expense_area LIKE '%Better Hospital Food%';
-- ### 7. Show the date, supplier name, description and amount for transactions with the 
-- expense area of 'Better Hospital Food'. You will need to INNER JOIN another table to be able to do this.
SELECT date,
    supplier,
    description,
    amount
from spends
    INNER JOIN suppliers ON spends.supplier_id = suppliers.id
    INNER JOIN expense_areas ON spends.expense_area_id = expense_areas.id
WHERE expense_area = 'Better Hospital Food';
-- ### 8. We have just received a late invoice for April! Add a new row to the spends table:
--     dated 1st April 2021
--     with a description of 'Computer Hardware Dell'
--     transaction number is 38104091 and the supplier's inv no is '3780119655'
--     the supplier is 'COMPUTACENTER (UK) LTD' (id 16)
--     the expense type is 'Computer Hardware Purch' (id 7)
--     the expense area is 'ICT Contingency' (id 18)
INSERT INTO spends (
        expense_type_id,
        expense_area_id,
        supplier_id,
        date,
        transaction_no,
        supplier_inv_no,
        description,
        amount
    )
VALUES (
        7,
        18,
        16,
        '2021-04-01',
        38104091,
        '3780119655',
        'Computer Hardware Dell',
        411520
    );
-- Checking
SELECT expense_type_id,
    expense_area_id,
    supplier_id,
    date,
    transaction_no,
    supplier_inv_no,
    description,
    amount
FROM spends
WHERE amount = 411520;
-- ### 9. If you examine the dates in the data, you will see they all are dated either 
-- 1st march 2021 or 1st April 2021. So if we group on the the date, there will only be two groups.
-- Show the date and the total amount spent on that date for these two dates by using a GROUP BY clause.
SELECT date,
    SUM(amount) AS total_spend
FROM spends
GROUP BY date;
-- ### 10. (optional) Great we now know the monthly spend. But it didn't look that good.
-- So I've changed my SELECT query to output this instead:
-- ```
--    Month    | Monthly Spend 
-- ------------+---------------
--  March 2021 | £ 28,674,452
--  April 2021 | £ 22,895,194
-- (2 rows)
-- ```
-- Can you work out how to do this?