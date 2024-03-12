
  create view `dbt_dev`.`plain_Total_Revenue_by_Payment_Method__dbt_tmp` as (
    SELECT payment_method, SUM(amount) AS total_revenue
FROM `dbt_dev`.`iraw_payments`
GROUP BY payment_method
  );