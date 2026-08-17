-- Question 3 Segment customers into High / Medium / Low value
with  segments as (select customer_id,sum(amount) as total_spend from transactions 
Group by customer_id),

Min_max as (
select max(total_spend) as max_amount,min(total_spend) as min_amount from segments),

threshold as (
select  min_amount + (max_amount - min_amount) * 0.34 as threshold_1, 
 min_amount + (max_amount - min_amount) * 0.67  as threshold_2 from Min_max),

Customer_segment as(
 select customer_id,total_spend,case when total_spend <= threshold_1 then 'Low'
 when total_spend > threshold_1 and total_spend < threshold_2 then 'Medium'
 else'High' End as Segments from segments
 cross join threshold)
 
select Segments,count(customer_id) as total_customers,sum(total_spend) as total_amount,
round(avg(total_spend), 2) as average_spend
from Customer_segment
group by Segments
order by Segments;

-- Insights
-- A comparison of NTILE(3) and MIN()-MAX() segmentation revealed that customer classification depends heavily on the chosen method. 
-- NTILE(3) created evenly distributed customer groups, whereas the MIN()-MAX() approach showed 
-- that most customers were low-value spenders and only a small proportion qualified as 
-- high-value customers. This suggests that the business has a highly uneven spending distribution,
-- with revenue concentrated among a limited number of customers.


