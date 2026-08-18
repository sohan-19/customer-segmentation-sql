-- Question 4 Find top 20% customers contributing to 80% revenue (Pareto logic)
with c as (
    select
        customer_id,
        sum(amount) as total_spend
    from transactions
    group by customer_id
),

total_revenue as (
    select
        sum(total_spend) as total_revenue
    from c
),

cumulative_revenue as (
    select
        customer_id,
        total_spend,

        sum(total_spend) over (
            order by total_spend desc
            rows between unbounded preceding and current row
        ) as running_total,

        row_number() over (
            order by total_spend desc
        ) as customer_rank,

        count(*) over () as total_customers

    from c
),

pareto as (
    select
        customer_id,
        total_spend,
        running_total,

        round(
            running_total * 100.0 / total_revenue,
            2
        ) as cumulative_percentage,

        round(
            customer_rank * 100.0 / total_customers,
            2
        ) as customer_percentage

    from cumulative_revenue
    cross join total_revenue
)

select *
from pareto
where customer_percentage <= 20
order by total_spend desc;


-- Insights
-- Pareto analysis showed that the top 20% of customers generated 52.33% of total revenue. 
-- This indicates that revenue is concentrated among high-value customers, 
-- but the dataset does not strictly follow the 80/20 rule. 
-- The results suggest a more balanced revenue distribution across the customer base, 
-- reducing dependence on a small group of customers.


-- Business recommendation & Observation Recommendation
-- Top 20% generate 52.33% of revenue - Retain high-value customers
-- Revenue is more evenly distributed - Continue acquiring new customers
-- The 80/20 rule is not observed - Do not focus only on VIP customers
