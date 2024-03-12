

SELECT payment_method, SUM(amount) AS total_revenue
FROM `dbt_dev`.`iraw_payments`
GROUP BY payment_method