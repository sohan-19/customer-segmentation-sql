-- Question 1: Find total spend per customer
select c.customer_id,coalesce (sum(t.amount),0) as total_spend from customers c
left join transactions as t on c.customer_id=t.customer_id
group by c.customer_id;