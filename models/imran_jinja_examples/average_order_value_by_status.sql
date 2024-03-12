{{ 
  config(materialized='table')
}}

SELECT o.order_status, AVG(p.amount) AS avg_order_value
FROM {{ ref('iraw_orders') }} o
JOIN {{ ref('iraw_payments') }} p ON o.order_id = p.order_id
GROUP BY o.order_status
