-- Question 5 Find customers who  spent in all categories
select customer_id,count(distinct product_category) as product_count from transactions 
group by customer_id
having count(distinct product_category)=(select count(distinct product_category) from transactions );
