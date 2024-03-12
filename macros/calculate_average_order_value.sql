{% macro calculate_average_order_value() %}

SELECT
    o.user_id AS customer_id,
    AVG(p.amount) AS average_order_value
FROM {{ ref('iraw_orders') }} o
JOIN {{ ref('iraw_payments') }} p ON o.order_id = p.order_id
WHERE p.payment_status = 'success'
GROUP BY o.user_id

{% endmacro %}
