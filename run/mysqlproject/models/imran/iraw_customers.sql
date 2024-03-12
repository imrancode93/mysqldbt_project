
  create view `dbt_dev`.`iraw_customers__dbt_tmp` as (
    -- stg_customers.sql

SELECT
    id as customer_id,
    first_name,
    last_name
FROM raw.raw_customers
  );