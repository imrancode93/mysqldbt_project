
  create view `dbt_dev`.`segmented_revenue_analysis__dbt_tmp` as (
    




WITH combined_segments AS (
  
    
      
      SELECT
        
          DATE(created_at) AS period,
        
        'credit_card' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'credit_card'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          DATE(created_at) AS period,
        
        'coupon' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'coupon'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          DATE(created_at) AS period,
        
        'bank_transfer' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'bank_transfer'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          DATE(created_at) AS period,
        
        'gift_card' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'gift_card'
      GROUP BY period
      
      UNION ALL
      
    
  
    
      
      SELECT
        
          CONCAT(YEAR(created_at), '-', WEEK(created_at)) AS period,
        
        'credit_card' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'credit_card'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          CONCAT(YEAR(created_at), '-', WEEK(created_at)) AS period,
        
        'coupon' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'coupon'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          CONCAT(YEAR(created_at), '-', WEEK(created_at)) AS period,
        
        'bank_transfer' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'bank_transfer'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          CONCAT(YEAR(created_at), '-', WEEK(created_at)) AS period,
        
        'gift_card' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'gift_card'
      GROUP BY period
      
      UNION ALL
      
    
  
    
      
      SELECT
        
          DATE_FORMAT(created_at, '%Y-%m') AS period,
        
        'credit_card' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'credit_card'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          DATE_FORMAT(created_at, '%Y-%m') AS period,
        
        'coupon' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'coupon'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          DATE_FORMAT(created_at, '%Y-%m') AS period,
        
        'bank_transfer' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'bank_transfer'
      GROUP BY period
      
      UNION ALL
      
    
      
      SELECT
        
          DATE_FORMAT(created_at, '%Y-%m') AS period,
        
        'gift_card' AS payment_method,
        SUM(amount) AS total_revenue
      FROM `dbt_dev`.`iraw_payments`
      WHERE payment_method = 'gift_card'
      GROUP BY period
      
    
  
)

SELECT
  period,
  payment_method,
  SUM(total_revenue) AS total_revenue
FROM combined_segments
GROUP BY period, payment_method
ORDER BY period, payment_method
  );