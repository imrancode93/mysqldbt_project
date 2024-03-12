{{ 
  config(materialized='view')
}}

SELECT
  c.customer_id,
  AVG(p.amount) AS avg_revenue_per_order,
  COUNT(o.order_id) AS total_orders,
  AVG(p.amount) * COUNT(o.order_id) AS estimated_clv
FROM {{ ref('iraw_customers') }} c
JOIN {{ ref('iraw_orders') }} o ON c.customer_id = o.user_id
JOIN {{ ref('iraw_payments') }} p ON o.order_id = p.order_id
GROUP BY c.customer_id

