-- stg_payments.sql

SELECT
    ID as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as payment_status,
    CAST(AMOUNT AS DECIMAL(10,2)) as amount,
    STR_TO_DATE(CREATED, '%Y-%m-%d %H:%i:%s') as created_at,
    STR_TO_DATE(REPLACE(REPLACE(_BATCHED_AT, 'T', ' '), 'Z', ''), '%Y-%m-%d %H:%i:%s') as batched_at
FROM raw.raw_payments