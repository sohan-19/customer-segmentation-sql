-- Question 6 Find the highest single transaction per category
select product_category ,max(amount)as highest_transaction from transactions
group by product_category;

