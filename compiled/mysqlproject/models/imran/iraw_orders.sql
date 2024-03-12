-- stg_orders.sql

SELECT
    id as order_id,
    user_id,
    STR_TO_DATE(order_date, '%Y-%m-%d %H:%i:%s') as order_date,
    status as order_status
FROM raw.raw_orders