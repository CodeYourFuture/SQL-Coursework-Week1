--TASK 2 transactions whose description includes the word 'fee'

SELECT date, transaction_no, supplier_inv_no, description FROM spends WHERE description LIKE '%fee%';