SELECT
  c.customer_id,
  AVG(p.amount) AS avg_revenue_per_order,
  COUNT(o.order_id) AS total_orders,
  AVG(p.amount) * COUNT(o.order_id) AS estimated_clv
FROM dbt_dev.iraw_customers c
JOIN dbt_dev.iraw_orders o ON c.customer_id = o.user_id
JOIN dbt_dev.iraw_payments p ON o.order_id = p.order_id
GROUP BY c.customer_id