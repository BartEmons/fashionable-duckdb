select
    order_id,
    order_date,
    total_order_amount,
    total_order_quantity
from {{ ref('int_orders_grouped') }}