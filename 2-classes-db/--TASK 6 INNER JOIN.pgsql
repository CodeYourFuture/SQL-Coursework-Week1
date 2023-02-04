-- TASK 6 INNER JOIN

SELECT date, supplier_id, description,amount FROM spends
JOIN expense_areas ON spends.expense_area_id=expense_areas.id AND expense_areas.expense_area='Better Hospital Food';
