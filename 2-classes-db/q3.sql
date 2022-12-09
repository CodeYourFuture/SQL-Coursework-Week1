SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends
WHERE description LIKE '%Fee%';