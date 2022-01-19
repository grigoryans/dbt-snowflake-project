with orders as (
    select * from {{ ref('stg_orders') }}
)
, daily as (
    select order_date
          , count(distinct customer_id) customers
          , count(*)                    orders
    from orders
    where status = 'completed'
    group by order_date
)
select * from daily

-- select *
-- FROM {{ ref('emps') }}






