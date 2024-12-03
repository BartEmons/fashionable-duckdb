select
    order_id,
    order_date,
    order_status,
    fulfilment_channel,
    sales_channel,
    ship_city,
    ship_state,
    ship_country
from {{ ref('int_orders_grouped') }}