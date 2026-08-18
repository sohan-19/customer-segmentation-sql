-- Question 5 Identify inactive customers (high recency, low frequency)
with customer_activity as
(
    select
        customer_id,
        recency,
        count(product_category) as frequency
    from transactions
    group by customer_id, recency
)
select
    customer_id,
    recency,
    frequency,
	case when recency > 90 then 'Yes'
        else 'No'
    end as inactive
from customer_activity
order by recency desc;



--Insight:
-- 196 customers were flagged as inactive (recency > 90 days, out of a 0–99 day range).
-- However, frequency was constant at 6 transactions for every customer in the dataset, 
-- so it added no discriminating power to the analysis 
-- the inactive segment was effectively determined by recency alone, 
-- not a true recency-frequency interaction.

-- Limitation:
-- This dataset lacks variation in the frequency column, 
-- so it isn't suitable for real RFM-style segmentation. 
-- In production data, frequency should vary meaningfully across customers.

-- Recommendation:

-- Re-validate the source data to confirm frequency should vary; if it doesn't, 
-- treat this as a recency-only segmentation.
-- Once frequency shows real variance, combine it with recency (and monetary value) for a true RFM model.
-- For re-engagement: target the 196 high-recency customers with personalized discounts, 
-- reminder emails, and product recommendations based on purchase history.
