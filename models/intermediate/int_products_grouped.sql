with int_products_grouped as (
    select
        order_date,
        sku,
        style,
        category,
        size,
        asin,
        sum(quantity) as total_sku_quantity,
        sum(amount) as total_sku_sales
    from {{ ref('stg_fashionable__sales') }}
    where order_status not in ('Cancelled', 'Returned')
    group by all
)

select * from int_products_grouped