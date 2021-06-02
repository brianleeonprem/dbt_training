with dbt__CTE__INTERNAL_test as (
select
payment_method, sum(amount)
from dbt_training.dbt_blee.stg_payment_sample
group by payment_method
having sum(amount)<30000
)select * from dbt__CTE__INTERNAL_test