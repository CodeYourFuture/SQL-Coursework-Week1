-- TASK 10
SELECT date, SUM(amount) AS "Monthly Spend" from spends GROUP BY date;