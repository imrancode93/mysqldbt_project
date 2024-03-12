-- models/total_revenue_by_customer.sql


SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_revenue
FROM `dbt_dev`.`iraw_customers` c
JOIN `dbt_dev`.`iraw_orders` o ON c.customer_id = o.user_id
JOIN `dbt_dev`.`iraw_payments` p ON o.order_id = p.order_id
WHERE p.payment_status = 'success'
GROUP BY c.customer_id, c.first_name, c.last_name

