-- Question 3: Find Customers who never made any transaction
select c.customer_id from customers c
left join transactions t on c.customer_id=t.customer_id
where t.transaction_id Is Null
group by c.customer_id;


SELECT c.customer_id
FROM customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM transactions t
    WHERE t.customer_id = c.customer_id
);

SELECT COUNT(*) FROM customers;
SELECT COUNT(DISTINCT customer_id) FROM transactions;