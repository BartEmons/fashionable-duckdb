with source as (
    select * from {{ ref('fashionable') }}
),

raw_sales as (
    select
        cast(index as int) as row_id,
        cast("Order ID" as varchar) as order_id,
        cast(strptime("Date", '%m-%d-%y') as date) as order_date,
        cast("Status" as varchar) as order_status,
        cast("Fulfilment" as varchar) as fulfilment_channel,
        cast("Sales Channel " as varchar) as sales_channel,
        cast("ship-service-level" as varchar) as ship_service_level,
        cast("Style" as varchar) as style,
        cast("SKU" as varchar) as sku,
        cast("Category" as varchar) as category,
        cast("Size" as varchar) as size,
        cast("ASIN" as varchar) as asin,
        cast("Courier Status" as varchar) as courier_status,
        cast("Qty" as int) as quantity,
        cast("currency" as varchar) as currency,
        cast("Amount" as float) as amount,
        cast("ship-city" as varchar) as ship_city,
        cast("ship-state" as varchar) as ship_state,
        cast("ship-postal-code" as varchar) as ship_postal_code,
        cast("ship-country" as varchar) as ship_country,
        cast("promotion-ids" as varchar) as promotion_ids,
        case 
            when 'B2B' = 'True' then true  
            when 'B2B' = 'False' then false
        end::boolean as b2b,
        cast("fulfilled-by" as varchar) as fulfilled_by
    from source
)

select * from raw_sales