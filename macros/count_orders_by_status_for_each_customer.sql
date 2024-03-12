-- depends_on: {{ ref('iraw_orders') }}
{% macro count_orders_by_status_for_each_customer() %}
SELECT
  user_id AS customer_id,
  order_status,
  COUNT(*) AS order_count
FROM  {{ ref('iraw_orders') }}
GROUP BY customer_id, order_status
{% endmacro %}


