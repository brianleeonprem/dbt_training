with orders as (
    select *
    from DBT_TRAINING.PUBLIC.ORDERS
    where order_date between '4/1/2018' and '4/30/2018'
)

select * from orders