with int_products_grouped as (
    select
        order_id,
        sku,
        order_date,
        style,
        category,
        size,
        asin,
        fulfilment_channel,
        sales_channel,
        ship_city,
        ship_state,
        ship_country,
        ship_postal_code,
        sum(quantity) as total_sku_quantity,
        round(sum(amount),2) as total_sku_sales
    from {{ ref('stg_fashionable__sales') }}
    where order_status not in ('Cancelled', 'Returned')
    group by all
)

select * from int_products_grouped