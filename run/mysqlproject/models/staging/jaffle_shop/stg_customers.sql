
  create view `dbt_dev`.`stg_customers__dbt_tmp` as (
    with customers as (
    
    select 
        id as customer_id,
        first_name,
        last_name

    from `raw`.`raw_customers`
)

select * from customers
  );