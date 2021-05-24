1.
SELECT date, transaction_no, description, amount  FROM spends WHERE amount > £30,000 and amount < £31,000;
2.
SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends  WHERE description LIKE '%fee%';
3.
SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends  WHERE description LIKE '%Fee%';
4.
SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends  WHERE description ILIKE '%fee%';
5.
SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends  WHERE Lower(description)=LOWER('fee');
6.
SELECT date, transaction_no, supplier_inv_no, description, amount FROM spend WHERE amount IN (25000, 30000, 35000, 40000);
7.
SELECT date, supplier, description, amount from spends
INNER JOIN suppliers ON spends.supplier_id = suppliers.id
INNER JOIN expense_areas ON spends.expense_area_id = expense_areas.id
WHERE expense_area LIKE '%Better Hospital Food%';
8.
INSERT INTO spends (expense_type_id, expense_area_id, supplier_id, 
date, transaction_no, supplier_inv_no, 
description, amount) 
VALUES (7,18,16,'2021-04-01',38104091,'3780119655','Computer Hardware Dell',32000);
9.
SELECT date, SUM(amount) AS total_spend FROM spends GROUP BY date;
10.
SELECT TO_CHAR(date,'FMMonth yyyy')
 as "Month", TO_CHAR(SUM(amount), 'FM£99,999,999') 
 as "Monthly Spend" FROM spends GROUP BY date;