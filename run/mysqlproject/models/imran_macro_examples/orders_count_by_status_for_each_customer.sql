
  create view `dbt_dev`.`orders_count_by_status_for_each_customer__dbt_tmp` as (
    -- models/orders_count_by_status_for_each_customer.sql
-- depends_on: `dbt_dev`.`iraw_orders`

SELECT
  user_id AS customer_id,
  order_status,
  COUNT(*) AS order_count
FROM  `dbt_dev`.`iraw_orders`
GROUP BY customer_id, order_status

  );