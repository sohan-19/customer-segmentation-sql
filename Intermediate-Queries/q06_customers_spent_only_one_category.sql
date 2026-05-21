-- Question 6 Find customers who  spent only in one category
select customer_id,count(distinct product_category) as product_count from transactions 
group by customer_id
having count(distinct product_category)=1;

-- Explanation:
-- This query groups transactions by customer_id and counts the number of distinct product categories each customer purchased. 
--The HAVING COUNT(DISTINCT product_category) = 1 condition filters only those customers who spent in exactly one category.
-- In my dataset, the query returned no output because every customer has transactions in all 6 product categories, so:
-- COUNT(DISTINCT product_category) = 6
-- for every customer, not 1. Therefore, no customer satisfies the condition, resulting in an empty output.
-- This means the query logic is correct, but the sample data does not contain any customer who spent in only one category.