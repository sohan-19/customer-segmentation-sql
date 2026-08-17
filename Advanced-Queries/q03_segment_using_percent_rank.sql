-- Question 3 Segment customers into High / Medium / Low value
with  segments as (select customer_id,sum(amount) as total_spend,round (percent_rank() over(
order by sum(amount) DESC) :: numeric,2
) as percentile_rank from transactions 
Group by customer_id),

Customer_segment as (
select customer_id,total_spend ,percentile_rank ,case when percentile_rank <=0.20 
then 'High' when percentile_rank <=0.70 then 'Medium' else 'low' end as spender_segment from segments
order by percentile_rank)

select spender_segment,count(customer_id) as customer, sum(total_spend) as total_amount,round(avg(total_spend),2) as average_spender from Customer_segment 
group by spender_segment
order by spender_segment;

-- Insights
-- A comparison of three customer segmentation techniques (NTILE(), MIN()-MAX(), and 
-- PERCENT_RANK()) revealed that customer classification can vary significantly depending on 
-- the selected method. NTILE() created equally sized customer groups, while the MIN()-MAX() 
-- approach highlighted an uneven spending distribution. Among the three methods, 
-- PERCENT_RANK() provided the most meaningful segmentation by ranking customers based on 
-- their relative spending behavior, making it the most suitable approach for customer analytics and
-- marketing applications.
