select distinct
    sku as sku_id,
    sku,
    style,
    category,
    size,
    asin
from {{ ref('int_skus_grouped') }}