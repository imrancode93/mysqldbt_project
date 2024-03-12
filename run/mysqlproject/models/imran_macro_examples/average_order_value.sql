
  create view `dbt_dev`.`average_order_value__dbt_tmp` as (
    -- models/average_order_value.sql


SELECT
    o.user_id AS customer_id,
    AVG(p.amount) AS average_order_value
FROM `dbt_dev`.`iraw_orders` o
JOIN `dbt_dev`.`iraw_payments` p ON o.order_id = p.order_id
WHERE p.payment_status = 'success'
GROUP BY o.user_id


  );