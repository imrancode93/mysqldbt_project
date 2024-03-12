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
    order_id,
    sum(amount) as total_amount
from `dbt_dev`.`stg_payments`
group by 1
having not(total_amount >= 0)
      
    ) dbt_internal_test