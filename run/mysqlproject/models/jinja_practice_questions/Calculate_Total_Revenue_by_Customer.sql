
  create view `dbt_dev`.`Calculate_Total_Revenue_by_Customer__dbt_tmp` as (
    -- models/revenue_by_customer.sql

WITH customer_orders AS (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        o.order_id,
        
    FROM `dbt_dev`.`stg_customers` c
    JOIN `dbt_dev`.`stg_orders` o ON c.customer_id = o.customer_id
),

order_payments AS (
    SELECT
        o.order_id,
        SUM(p.amount) AS total_payment
    FROM customer_orders o
    JOIN `dbt_dev`.`stg_payments` p ON o.order_id = p.order_id
    GROUP BY o.order_id
),

revenue_by_customer AS (
    SELECT
        customer_id,
        first_name,
        last_name,
        SUM(total_payment) AS total_revenue
    FROM order_payments
    GROUP BY customer_id, first_name, last_name
)

SELECT * FROM revenue_by_customer
  );