
WITH raw_listings AS (
    SELECT
        *
    FROM
       {{ source('airbnb_raw', 'listings_raw') }}
)
SELECT
    id AS listing_id,
    name AS listing_name,
    listing_url,
    room_type,
    minimum_nights,
    host_id,
    CAST(price AS FLOAT64) AS price,
    created_at,
    updated_at
FROM
    raw_listings