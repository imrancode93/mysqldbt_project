With orders as (
 Select * from `dbt_dev`.`stg_orders`
),
daily as (
Select 
Order_date,
count(*) as order_num
From orders
Group by 1
)
Select * from daily