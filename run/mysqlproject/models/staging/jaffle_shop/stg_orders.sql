
  create view `dbt_dev`.`stg_orders__dbt_tmp` as (
    with orders as (
    
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from `raw`.`raw_orders`
)

select * from orders
  );