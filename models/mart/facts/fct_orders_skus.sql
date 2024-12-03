select
    order_id,
    {{ dbt_utils.generate_surrogate_key(["ship_city", "ship_state", "ship_postal_code", "ship_country"]) }} as ship_location_id,
    sku as sku_id,
    order_date,
    total_sku_quantity,
    total_sku_sales
from {{ ref('int_orders_skus_grouped') }}