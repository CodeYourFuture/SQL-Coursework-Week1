-- TASK 4 CASE INSENSITIVE
SELECT * FROM spends WHERE description ILIKE '%FEE%';
-- in postgresql is case sensitive so to make it case insensitive we need to use ILIKE key word.