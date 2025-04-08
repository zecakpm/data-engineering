{{ config(
    materialized='view'
)}}

WITH src_listings AS (
    SELECT * FROM {{ ref('src_listings') }}
)
SELECT
    listing_id,
    listing_name,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    room_type,
    host_id,
    price,
    created_at,
    updated_at
FROM
    src_listings