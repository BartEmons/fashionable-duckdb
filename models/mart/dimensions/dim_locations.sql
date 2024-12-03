with dim_location as (
    select distinct
        {{ dbt_utils.generate_surrogate_key(["ship_city", "ship_state", "ship_postal_code", "ship_country"]) }} as location_id,
        ship_city,
        ship_state,
        ship_postal_code,
        ship_country
    from {{ ref('int_locations_deduplicated') }}
)
select * from dim_location