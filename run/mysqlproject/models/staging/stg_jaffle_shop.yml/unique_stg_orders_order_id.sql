select
      count(*) as failures,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_warn,
      case
        when count(*) <> 0 then 'true'
        else 'false'
      end as should_error
    from (
      
    
    

select
    order_id as unique_field,
    count(*) as n_records

from `dbt_dev`.`stg_orders`
where order_id is not null
group by order_id
having count(*) > 1



      
    ) dbt_internal_test