-- Question 3 Segment customers into High / Medium / Low value
with  segments as (select customer_id,sum(amount) as amount,Ntile(3) Over(order by sum(amount) DESC) as
Segments from transactions 
Group by customer_id),

Customer_segments as (
select customer_id,amount ,Segments ,Case when Segments = 1 then 'High' 
when Segments = 2 then 'Medium' else 'Low' end as spender_Segment from segments)

select spender_segment,count(customer_id) as total_customers
,sum(amount) as Total_amount,round(avg(amount),2) as Average_spender from Customer_segments
group by spender_segment
order by spender_segment;

-- Insights 
-- Customer spending is highly concentrated among high-value customers. 
-- Although the three segments contain almost the same number of customers (because NTILE(3) was used), 
-- high-value customers generated ₹1,011,009 in revenue with an average spend of ₹1,353.43, 
-- compared with ₹307,895 (₹412.18 average) for medium-value customers and only ₹38,084 (₹51.05 average) for low-value customers. 
-- This suggests that a relatively small change in the purchasing behavior of high-value customers could have a significant impact on overall business revenue.