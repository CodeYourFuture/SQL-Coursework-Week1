-- TASK 4 CASE INSENSITIVE
use homework;
SELECT date, transaction_no, supplier_inv_no, description, amount  FROM spends WHERE description ILIKE '%FEE%';
-- in postgresql is case sensitive so to make it case insensitive we need to use ILIKE key word.