

  create  table
    `dbt_dev`.`total_rev_by_payment_method__dbt_tmp`
  as (
    

SELECT payment_method, SUM(amount) AS total_revenue
FROM `dbt_dev`.`iraw_payments`
GROUP BY payment_method
  )
