with int_locations_deduplicated as (
    select distinct
        ship_city,
        ship_state,
        ship_postal_code,
        ship_country
    from {{ ref('stg_fashionable__sales') }}
)
select * from int_locations_deduplicated