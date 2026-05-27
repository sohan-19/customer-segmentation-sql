-- Question 2 Rank customers based on total spend
select customer_id,sum(amount) as Total_Spend,dense_rank()over(order by sum(amount) DESC ) as Dense_rank from Transactions
group by customer_id;