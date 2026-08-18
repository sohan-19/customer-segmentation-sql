-- Question 6 Find customers with high frequency but low monetary value
with customer_value as
(
    select
        customer_id,
        count(product_category) as frequency,
        sum(amount) as monetary
    from transactions
    group by customer_id
)
select
    customer_id,
    frequency,
    monetary,
    case
        when frequency < 10 and monetary < 500 then 'Yes'
        else 'No'
    end as high_freq_low_monetary
from customer_value
order by frequency desc;

-- Insight:
-- 683 customers were flagged as high-frequency, low-monetary (frequency < 10, monetary < 500). 
-- However, since every customer in the dataset had the same frequency (6 transactions), 
-- this segmentation was effectively monetary only customers were separated purely by spend, 
-- not by any real frequency variation.

-- Recommendation:
-- Confirm whether frequency is expected to vary per customer in the source/generated data; 
-- if not, drop frequency from this segmentation and rename it as a monetary-only analysis.
-- Once frequency has real variation, re-run this segmentation to identify genuinely high-frequency, 
-- low-spend customers (small, frequent purchases) a valuable group for upselling or bundling strategies.
-- For the current low-monetary segment: consider upsell campaigns, bundle offers, 
-- or minimum-spend incentives to increase average order value.



