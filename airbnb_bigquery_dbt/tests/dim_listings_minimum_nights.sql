SELECT 
    *
FROM
    {{ ref('dim_listings')}}
WHERE minimum_nights < 0
LIMIT 10