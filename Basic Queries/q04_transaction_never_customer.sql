-- Question 4 Find customers who never made any transaction
SELECT c.customer_id FROM customers c
LEFT JOIN transactions t ON c.customer_id = t.customer_id
WHERE t.transaction_id IS NULL;

--It indicates all customers in the dataset have at least one transaction, so no unmatched records exist.
