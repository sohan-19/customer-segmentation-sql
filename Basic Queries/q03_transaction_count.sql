-- Question 3:Count total transactions per customer
SELECT customer_id, COUNT(*) AS count_of_transaction FROM transactions 
GROUP BY customer_id;
