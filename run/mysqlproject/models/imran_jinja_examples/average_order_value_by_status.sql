

  create  table
    `dbt_dev`.`average_order_value_by_status__dbt_tmp`
  as (
    

SELECT o.order_status, AVG(p.amount) AS avg_order_value
FROM `dbt_dev`.`iraw_orders` o
JOIN `dbt_dev`.`iraw_payments` p ON o.order_id = p.order_id
GROUP BY o.order_status
  )
