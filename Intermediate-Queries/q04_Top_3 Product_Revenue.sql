-- Question 3 Find top 3 product categories by revenue
select product_category ,revenue 
from(select product_category ,sum(amount) as revenue from transactions
group by product_category) as t 
order by revenue desc
limit 3;

--Or

SELECT product_category, SUM(amount) AS revenue
FROM transactions
GROUP BY product_category
ORDER BY revenue DESC
LIMIT 3;
