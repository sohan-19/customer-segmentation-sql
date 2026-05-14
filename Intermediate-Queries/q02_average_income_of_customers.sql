-- Question 2 Find average income of customers who spent > 1000
select round(avg(c.income),2) as average_income from customers c
inner join transactions as t on c.customer_id=t.customer_id
where amount>1000;

