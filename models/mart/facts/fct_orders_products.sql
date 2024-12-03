select
    order_date,
    sku,
    total_sku_quantity,
    total_sku_sales
from {{ ref('int_products_grouped') }}