SELECT * FROM expense_areas;

SELECT * FROM expense_types;

SELECT * FROM spends;

SELECT * FROM suppliers;

SELECT date, transaction_no, description FROM spends WHERE amount BETWEEN 30000 AND 31000;

SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE description LIKE '%fee%';

SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE description LIKE '%Fee%';

SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE description ~* 'fee';

SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE amount = 25000 OR amount = 30000 OR amount = 35000 OR amount = 40000;

SELECT spends.expense_area_id, date, supplier_id, description, amount
FROM spends
INNER JOIN expense_areas ON expense_areas.id = spends.expense_area_id
WHERE spends.expense_area_id = 2;

SELECT date, supplier, description, amount
FROM spends
INNER JOIN suppliers ON suppliers.id = spends.supplier_id 
WHERE spends.expense_area_id = 2;

INSERT INTO spends (
expense_type_id, expense_area_id, supplier_id, date, transaction_no, supplier_inv_no, description, amount
) VALUES (
7, 18, 16, '2021-04-01', 38104091, '3780119655', 'Computer Hardware Dell', 0
);

