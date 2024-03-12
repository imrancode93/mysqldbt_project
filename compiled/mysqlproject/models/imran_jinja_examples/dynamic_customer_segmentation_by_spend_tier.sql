

SELECT
  customer_id,
  first_name,
  last_name,
  total_spend,
  CASE
    
      
        WHEN total_spend >= 0 AND total_spend < 100 THEN 'Bronze'
      
    
      
        WHEN total_spend >= 100 AND total_spend < 500 THEN 'Silver'
      
    
      
        WHEN total_spend >= 500 AND total_spend < 1000 THEN 'Gold'
      
    
      
        WHEN total_spend >= 1000 THEN 'Platinum'  -- Handle the highest tier without an upper limit
      
    
  END AS spend_tier
FROM (
  SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spend
  FROM `dbt_dev`.`iraw_customers` c
  JOIN `dbt_dev`.`iraw_payments` p ON c.customer_id = p.order_id  -- Assuming order_id in stg_payments can be linked directly to customer_id
  GROUP BY c.customer_id, c.first_name, c.last_name
) spend_data