with orders as (
    select * from {{ ref('stg_orders') }}
)

, payments as (
    select * from {{ ref('stg_payments') }}
)

, final as (
select o.order_id
     , o.customer_id
     , p.amount_usd
from orders as o
    join payments as p
        on o.order_id = p.order_id
where p.status = 'success'
)
select * from final
        