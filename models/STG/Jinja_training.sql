
{%- set parameter2 = ['coupon', 'credit_card', 'bank_transfer', 'gift_card']-%}


select
orderid, 
{%- for method in parameter2 -%}
sum(case when payment_method = '{{method}}' then amount else 0 end) as {{method}}
{%- if loop.last==False -%}
,
{% endif -%}
{% endfor %}
from {{ ref('stg_payment_sample')}}
group by 1

