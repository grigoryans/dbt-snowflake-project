with payments as (
    select id       as payment_id
    , orderid       as order_id
    , paymentmethod as payment_method
    , status        as status
    , created       as payment_date
    , amount/100    as amount_usd
    from {{ source('stripe_source', 'payment') }}
)
select * from payments