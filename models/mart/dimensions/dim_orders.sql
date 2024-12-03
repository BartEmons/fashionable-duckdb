select distinct
    order_id,
    order_date,
    order_status,
    fulfilment_channel,
    sales_channel
from {{ ref('int_orders_grouped') }}