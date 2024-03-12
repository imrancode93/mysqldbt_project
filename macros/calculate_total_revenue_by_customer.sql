{% macro calculate_total_revenue_by_customer() %}

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_revenue
FROM {{ ref('iraw_customers') }} c
JOIN {{ ref('iraw_orders') }} o ON c.customer_id = o.user_id
JOIN {{ ref('iraw_payments') }} p ON o.order_id = p.order_id
WHERE p.payment_status = 'success'
GROUP BY c.customer_id, c.first_name, c.last_name

{% endmacro %}
