with dim_location as (
    select distinct
        {{ dbt_utils.generate_surrogate_key(["ship_city", "ship_state", "ship_postal_code", "ship_country"]) }} as location_id,
        ship_city as city,
        ship_state as state,
        ship_postal_code as postal_code,
        ship_country as country
    from {{ ref('int_locations_deduplicated') }}
)
select * from dim_location