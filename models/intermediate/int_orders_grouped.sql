with int_orders_grouped as (
    select
        order_id,
        order_date,
        order_status,
        fulfilment_channel,
        sales_channel,
        ship_city,
        ship_state,
        ship_country,
        ship_postal_code,
        round(sum(amount), 2) as total_order_amount,
        sum(quantity) as total_order_quantity
    from {{ ref('stg_fashionable__sales') }}
    group by all
)
select * from int_orders_grouped