{% set time_periods = ['daily', 'weekly', 'monthly'] %}
{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}
{% set total_iterations = time_periods | length * payment_methods | length %}
{% set counter = namespace(value=0) %}

WITH combined_segments AS (
  {% for period in time_periods %}
    {% for method in payment_methods %}
      {% set counter.value = counter.value + 1 %}
      SELECT
        {% if period == 'daily' %}
          DATE(created_at) AS period,
        {% elif period == 'weekly' %}
          CONCAT(YEAR(created_at), '-', WEEK(created_at)) AS period,
        {% elif period == 'monthly' %}
          DATE_FORMAT(created_at, '%Y-%m') AS period,
        {% endif %}
        '{{ method }}' AS payment_method,
        SUM(amount) AS total_revenue
      FROM {{ ref('iraw_payments') }}
      WHERE payment_method = '{{ method }}'
      GROUP BY period
      {% if counter.value < total_iterations %}
      UNION ALL
      {% endif %}
    {% endfor %}
  {% endfor %}
)

SELECT
  period,
  payment_method,
  SUM(total_revenue) AS total_revenue
FROM combined_segments
GROUP BY period, payment_method
ORDER BY period, payment_method


