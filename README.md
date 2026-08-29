Customer Segmentation & Transaction Analysis (SQL)

SQL-based customer segmentation and transaction analysis using PostgreSQL, covering basic to advanced queries on a real-world dataset sourced from Kaggle.

Project Overview

This project analyzes customer purchase behavior using pure SQL — starting from basic aggregation queries and progressing to advanced customer segmentation techniques like RFM (Recency, Frequency, Monetary) analysis, Pareto (80/20) analysis, and percentile-based value segmentation. The goal is to identify high-value customers, spending patterns, and category-level revenue insights that a business could use for targeted marketing and retention.

Dataset

Source: Kaggle Two relational tables, joined on customer_id:

customers

Column	Description
customer_id	Unique identifier for each customer
year_birth	Customer's birth year
education	Customer's education level
marital_status	Customer's marital status
income	Annual income
kidhome	Number of children in household
teenhome	Number of teenagers in household
signup_date	Date the customer signed up

transactions

Column	Description
transaction_id	Unique identifier for each transaction (Primary Key)
customer_id	Foreign key linking to customers
product_category	Category of the purchased product
amount	Transaction amount spent
recency	Days since the customer's last purchase

Tools & Techniques
PostgreSQL — relational querying and data analysis
Aggregate functions — SUM, AVG, COUNT, MAX
Joins & Subqueries — combining and filtering customer/transaction data
CTEs (Common Table Expressions) — structuring multi-step logic
Window Functions — RANK(), NTILE(), PERCENT_RANK()
Segmentation logic — RFM, Min-Max normalization, Pareto (80/20) principle

Repository Structure
 Datasets                           1 Raw customers & transactions data (Kaggle)
 Basic Queries                      2 Foundational SQL queries
 Basic-Queries-Output               3 Output/results of basic queries
 Intermediate-Queries               4 Grouping, filtering & comparative queries
Intermediate-Queries-Output       5 Output/results of intermediate queries
Advanced-Queries                  6 RFM, ranking & customer segmentation queries
Advanced-Queries-Output           7 Output/results of advanced queries
 README.md

Queries Covered
Basic Queries
Find total spend per customer
Find average spend per customer
Count total transactions per customer
Find customers who never made any transaction
Get total spend by product category
Find the highest single transaction per category

Intermediate Queries
Find total spend grouped by education level
Find average income of customers who spent > 1000
Find customers whose total spend is greater than the average spend of all customers
Find the top 3 product categories by revenue
Find customers who spent in all product categories
Find customers who spent in only one product category

Advanced Queries
Calculate Recency, Frequency, Monetary (RFM) values for each customer
Rank customers based on total spend
Segment customers into High / Medium / Low value using:
NTILE()
Min-Max normalization
PERCENT_RANK()
Identify the top 20% of customers contributing to 80% of revenue (Pareto analysis)
Identify inactive customers (high recency, low frequency)
Identify customers with high frequency but low monetary value

Key Insights
Revenue is concentrated, but not textbook 80/20. Pareto analysis showed the top 20% of customers generated 52.33% of total revenue — meaningful concentration, but well short of the classic 80/20 split. 
This suggests the business isn't over-reliant on a small VIP group; revenue is more evenly spread across the customer base than a typical Pareto pattern.
Business takeaway: retain the top 20% (they still matter), but marketing spend shouldn't be narrowly focused on VIP customers alone — continued acquisition and mid-tier customer engagement matter just as much here.

Key Concepts Demonstrated
Customer-level aggregation and behavioral analysis
Multi-table joins between customers and transactions
RFM segmentation — a standard technique used in real-world marketing analytics
Three different mathematical approaches to value-tier segmentation (Ntile, Min-Max, Percent Rank), useful for comparing segmentation methodologies
Pareto principle applied to revenue concentration
Identifying at-risk / inactive customer segments for retention targeting

Skills Demonstrated
SQL PostgreSQL Window Functions CTEs Customer Segmentation RFM Analysis Data Analysis Business Intelligence
