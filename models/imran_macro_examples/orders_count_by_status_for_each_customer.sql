-- models/orders_count_by_status_for_each_customer.sql
-- depends_on: {{ ref('iraw_orders') }}
{{ count_orders_by_status_for_each_customer() }}
