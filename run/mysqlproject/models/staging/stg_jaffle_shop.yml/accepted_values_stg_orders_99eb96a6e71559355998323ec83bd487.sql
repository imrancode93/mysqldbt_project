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
      
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from `dbt_dev`.`stg_orders`
    group by status

)

select *
from all_values
where value_field not in (
    'completed','shipped','returned','return_pending','placed'
)



      
    ) dbt_internal_test