-- Question 1 Find total spend grouped by education level
select c.education,sum(t.amount) as total_spend from customers c
left join transactions as t on c.customer_id=t.customer_id
group by education;