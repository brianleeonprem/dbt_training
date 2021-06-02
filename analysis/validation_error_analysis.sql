with all_values as (

    select distinct
        payment_method as value_field

    from dbt_training.dbt_blee.stg_payment_sample

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'credit_card','coupon','bank_transfer'
    )
)

select *
from validation_errors