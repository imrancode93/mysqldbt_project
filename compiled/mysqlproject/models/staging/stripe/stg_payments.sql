select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
     round( 1.0 * amount / 100, 4) as amount,
    created as created_at

from `raw`.`raw_payments`