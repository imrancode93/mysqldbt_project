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
    id as unique_field,
    count(*) as n_records

from `dbt_dev`.`my_second_dbt_model`
where id is not null
group by id
having count(*) > 1



      
    ) dbt_internal_test