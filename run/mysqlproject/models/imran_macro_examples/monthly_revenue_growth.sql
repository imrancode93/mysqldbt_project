
  create view `dbt_dev`.`monthly_revenue_growth__dbt_tmp` as (
    WITH monthly_revenue AS (
  SELECT
    DATE_FORMAT(CREATED_AT, '%Y-%m-01') AS revenue_month,
    SUM(AMOUNT) AS total_revenue
  FROM `dbt_dev`.`iraw_payments`
  GROUP BY revenue_month
),
revenue_growth AS (
  SELECT
    revenue_month,
    total_revenue,
    ((total_revenue - LAG(total_revenue) OVER (ORDER BY revenue_month)) / LAG(total_revenue) OVER (ORDER BY revenue_month)) * 100 AS growth_percentage
  FROM monthly_revenue
)

SELECT * FROM revenue_growth
  );