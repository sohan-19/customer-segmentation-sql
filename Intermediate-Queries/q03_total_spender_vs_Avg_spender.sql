-- Question 3 Find customers whose total spend is greater than average spend of all customers
select customer_id,sum(amount) as Total_spend from transactions
group by customer_id
having sum(amount)>(select avg(spender) from(select customer_id,sum(amount)as spender from transactions
group by customer_id)as avg);
