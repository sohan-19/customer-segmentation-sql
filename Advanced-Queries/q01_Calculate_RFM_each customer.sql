-- Question 1 Calculate Recency, Frequency, Monetary (RFM) for each customer
select customer_id,recency ,count(distinct transaction_id) as Frequency,sum(amount) as Monetary from transactions
group by customer_id,recency;



-- This dataset contains a pre-calculated recency column at the customer level, 
-- repeated across product categories. 
-- Therefore, recency is directly used in the query instead of being calculated from transaction dates. 
-- In real-world RFM analysis, recency is typically derived as the difference between a reference date and the customer’s most recent transaction date. 
-- This project uses a simplified dataset for SQL practice purposes.