select
    sku as sku_id,
    order_date,
    total_sku_quantity,
    total_sku_sales
from {{ ref('int_skus_grouped') }}