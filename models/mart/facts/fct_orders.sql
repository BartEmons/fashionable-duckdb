select
    order_id,
    {{ dbt_utils.generate_surrogate_key(["ship_city", "ship_state", "ship_postal_code", "ship_country"]) }} as ship_location_id,
    order_date,
    total_order_amount,
    total_order_quantity
from {{ ref('int_orders_grouped') }}