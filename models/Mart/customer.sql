{{ config (
    materialized = "view"
    )}}

with payment as (

    select * from {{ ref('stg_payment_sample')}}

),

orders as (

    select * from {{ ref('stg_order_Apr_sample') }}

),

customer_orders as (

    select
        userid,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(id) as number_of_orders

    from orders

    group by 1

),

final as (

    select
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce(customer_orders.number_of_orders, 0) as number_of_orders

    from customer_orders

)

select * from final