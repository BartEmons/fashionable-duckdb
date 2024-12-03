select
    sku,
    style,
    category,
    size,
    asin
from {{ ref('int_products_grouped') }}