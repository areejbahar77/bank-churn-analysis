-- Query 1: how many customers?
SELECT COUNT(*) AS total_customers
FROM churn_project.customers;

-- Query 2: overall churn rate
SELECT ROUND(AVG(exited) * 100, 1) AS churn_rate_pct
FROM churn_project.customers;

-- Query 3: churn by country
SELECT geography,
       COUNT(*) AS customers,
       ROUND(AVG(exited) * 100, 1) AS churn_rate_pct
FROM churn_project.customers
GROUP BY geography
ORDER BY churn_rate_pct DESC;

-- Query 4: churn by age group
SELECT age_group,
       COUNT(*) AS customers,
       ROUND(AVG(exited) * 100, 1) AS churn_rate_pct
FROM churn_project.customers
GROUP BY age_group
ORDER BY churn_rate_pct DESC;

-- Query 5: churn by number of products
SELECT num_of_products,
       COUNT(*) AS customers,
       ROUND(AVG(exited) * 100, 1) AS churn_rate_pct
FROM churn_project.customers
GROUP BY num_of_products
ORDER BY num_of_products;

-- Query 6: active vs inactive members
SELECT is_active_member,
       COUNT(*) AS customers,
       ROUND(AVG(exited) * 100, 1) AS churn_rate_pct
FROM churn_project.customers
GROUP BY is_active_member;