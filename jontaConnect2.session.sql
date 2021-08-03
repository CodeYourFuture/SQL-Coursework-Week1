SELECT * FROM expense_areas;

SELECT * FROM expense_types;

SELECT * FROM spends;

SELECT * FROM suppliers;

SELECT date, transaction_no, description FROM spends WHERE amount BETWEEN 30000 AND 31000;

SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE description LIKE '%fee%';

SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends WHERE description LIKE '%Fee%';