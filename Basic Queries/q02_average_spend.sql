-- Question 2: Find average spend per customer
select c.customer_id,round(coalesce (avg(t.amount),0),2) as Average_spend from customers c
left join transactions as t on c.customer_id=t.customer_id
group by c.customer_id;