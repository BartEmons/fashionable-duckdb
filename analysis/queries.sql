-- which products styles and categories are the most popular in Mumbai?
select
    p.style,
    p.category,
    sum(fp.total_sku_quantity) as total_units_sold,
    sum(fp.total_sku_sales) as total_sales_amount
from fashionable.main.fct_orders_products fp
join dim_product p on fp.sku = p.sku
join dim_orders o on fp.order_id = o.order_id
where o.ship_city = 'mumbai'
group by p.style, p.category
order by total_units_sold desc;

-- what is the sales trend for different seasons? 
select
    date_trunc('quarter', o.order_date) as season,
    sum(f.total_order_amount) as total_sales,
    sum(f.total_order_quantity) as total_units_sold
from fashionable.main.fct_orders f
join fashionable.main.dim_orders o on f.order_id = o.order_id
group by date_trunc('quarter', o.order_date)
order by season;

-- what is the sales trend between two dates?
select
    o.order_id,
    o.order_date,
    o.total_order_amount,
    o.total_order_quantity
from fashionable.main.fct_orders o
where o.order_date between '2022-04-01' and '2022-04-30'
order by o.order_date;

-- sales by product style and category between two dates
select
    p.style,
    p.category,
    sum(fp.total_sku_quantity) as total_units_sold,
    sum(fp.total_sku_sales) as total_sales_amount
from fashionable.main.fct_orders_products fp
join dim_product p on fp.sku = p.sku
where fp.order_date between '2022-01-01' and '2022-03-31'
group by p.style, p.category
order by total_sales_amount desc;