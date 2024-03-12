{% set spend_tiers = [
    {'name': 'Bronze', 'min_spend': 0, 'max_spend': 100},
    {'name': 'Silver', 'min_spend': 100, 'max_spend': 500},
    {'name': 'Gold', 'min_spend': 500, 'max_spend': 1000},
    {'name': 'Platinum', 'min_spend': 1000, 'max_spend': None} ] %}

SELECT
  customer_id,
  first_name,
  last_name,
  total_spend,
  CASE
    {% for tier in spend_tiers %}
      {% if tier.max_spend %}
        WHEN total_spend >= {{ tier.min_spend }} AND total_spend < {{ tier.max_spend }} THEN '{{ tier.name }}'
      {% else %}
        WHEN total_spend >= {{ tier.min_spend }} THEN '{{ tier.name }}'  -- Handle the highest tier without an upper limit
      {% endif %}
    {% endfor %}
  END AS spend_tier
FROM (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spend
  FROM {{ ref('iraw_customers') }} c
  JOIN {{ ref('iraw_payments') }} p ON c.customer_id = p.order_id  -- Assuming order_id in stg_payments can be linked directly to customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
) spend_data
