{{ 
  config(materialized='table')
}}

SELECT payment_method, SUM(amount) AS total_revenue
FROM {{ ref('iraw_payments')}}
GROUP BY payment_method
