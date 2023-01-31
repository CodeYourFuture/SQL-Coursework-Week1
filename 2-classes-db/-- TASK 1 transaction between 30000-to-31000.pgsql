-- Show the date, transaction_no, description and 
-- amount for those transactions whose amount is between £30,000 and £31,000

SELECT date,transaction_no,description, amount FROM spends WHERE 30000 < amount AND amount < 31000;