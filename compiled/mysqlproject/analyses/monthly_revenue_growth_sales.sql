SELECT
  DATE_FORMAT(created_at, '%Y-%m') AS revenue_month,
  SUM(amount) AS monthly_revenue,
  (SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE_FORMAT(created_at, '%Y-%m'))) / LAG(SUM(amount)) OVER (ORDER BY DATE_FORMAT(created_at, '%Y-%m')) * 100 AS growth_rate
FROM dbt_dev.iraw_payments
GROUP BY DATE_FORMAT(created_at, '%Y-%m')
ORDER BY revenue_month