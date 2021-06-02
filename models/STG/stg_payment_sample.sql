
with PAYMENTS as (
select
*, case when amount>2000 then amount else 0 end large_amt,
{{testmacro('amount')}} as twice_amt
from DBT_TRAINING.PUBLIC.PAYMENTS
)

select * from PAYMENTS