-- which products styles and categories are the most popular in Mumbai?
SELECT
    p.style,
    p.category,
    SUM(fp.total_sku_quantity) AS total_units_sold,
    SUM(fp.total_sku_sales) AS total_sales_amount
FROM fashionable.main.fct_orders_products fp
JOIN dim_product p ON fp.sku = p.sku
JOIN dim_orders o ON fp.order_id = o.order_id
WHERE o.ship_city = 'MUMBAI'
GROUP BY p.style, p.category
ORDER BY total_units_sold DESC;

-- what is the sales trend for different seasons? 
SELECT
    DATE_TRUNC('quarter', o.order_date) AS season,
    SUM(f.total_order_amount) AS total_sales,
    SUM(f.total_order_quantity) AS total_units_sold
FROM fashionable.main.fct_orders f
JOIN fashionable.main.dim_orders o ON f.order_id = o.order_id
GROUP BY DATE_TRUNC('quarter', o.order_date)
ORDER BY season;

-- what is the sales trend between two dates?
SELECT
    o.order_id,
    o.order_date,
    o.total_order_amount,
    o.total_order_quantity
FROM fashionable.main.fct_orders o
WHERE o.order_date BETWEEN '2022-04-01' AND '2022-04-30'
ORDER BY o.order_date;

-- sales by product style and category between two dates
SELECT
    p.style,
    p.category,
    SUM(fp.total_sku_quantity) AS total_units_sold,
    SUM(fp.total_sku_sales) AS total_sales_amount
FROM fashionable.main.fct_orders_products fp
JOIN dim_product p ON fp.sku = p.sku
WHERE fp.order_date BETWEEN '2022-01-01' AND '2022-03-31'
GROUP BY p.style, p.category
ORDER BY total_sales_amount DESC;