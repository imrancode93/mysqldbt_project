
  create view `dbt_dev`.`jinja_ Order_Count_by_Customer__dbt_tmp` as (
    

SELECT c.customer_id, c.first_name, c.last_name, COUNT(o.order_id) AS order_count
FROM `dbt_dev`.`iraw_customers` c
JOIN `dbt_dev`.`iraw_orders` o ON c.customer_id = o.user_id
GROUP BY c.customer_id, c.first_name, c.last_name
  );