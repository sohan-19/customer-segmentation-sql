-- Question 4 Find top 20% customers contributing to 80% revenue (Pareto logic)
with c as (select customer_id,sum(amount) as total_spend from transactions
group by customer_id),

total_revenue as (select sum(total_spend) as total_revenue from c),
cumulative_revenue AS
(
SELECT customer_id,
           total_spend,

           SUM(total_spend) OVER
           (
               ORDER BY total_spend DESC
               ROWS BETWEEN UNBOUNDED PRECEDING
               AND CURRENT ROW
           ) AS running_total,

           ROW_NUMBER() OVER
           (
               ORDER BY total_spend DESC
           ) AS customer_rank,

           COUNT(*) OVER () AS total_customers

    FROM c
),

pareto AS
(
    SELECT customer_id,
           total_spend,
           running_total,

           ROUND(
               running_total * 100.0 / total_revenue,
               2
           ) AS cumulative_percentage,

           ROUND(
               customer_rank * 100.0 / total_customers,
               2
           ) AS customer_percentage

    FROM cumulative_revenue
    CROSS JOIN total_revenue
)

SELECT *
FROM pareto
WHERE customer_percentage <= 20
ORDER BY total_spend DESC;


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