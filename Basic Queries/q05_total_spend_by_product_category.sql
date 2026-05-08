-- Question 5 Get total spend by product_category
select product_category ,sum(amount) as total_spend from transactions
group by product_category
order by total_spend desc;


--Conclusion
--The sales analysis clearly shows that:
--Wines dominate customer spending,followed by Meat Products,
--while categories such as Sweet Products and Fish Products contribute comparatively lower revenue.
--This kind of category-wise spending analysis is useful for revenue planning, inventory management, and customer behavior analysis.