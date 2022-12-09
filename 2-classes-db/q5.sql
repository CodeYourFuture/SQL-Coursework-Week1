SELECT date, transaction_no, supplier_inv_no, description, amount FROM spends
WHERE amount in (25000, 30000, 35000, 40000);