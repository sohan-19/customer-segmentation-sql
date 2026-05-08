-- Question 4 Find customers who never made any transaction
select c.customer_id from customers c
left join transactions as t on c.customer_id=t.customer_id
where t.transaction_id is null;

--It indicates all customers in the dataset have at least one transaction, so no unmatched records exist.