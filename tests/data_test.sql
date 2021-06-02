select
payment_method, sum(amount)
from {{ ref('stg_payment_sample') }}
group by payment_method
having sum(amount)<20000