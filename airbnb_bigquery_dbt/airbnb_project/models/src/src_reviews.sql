WITH raw_reviews AS (
    SELECT
        *
    FROM
       {{ source('airbnb_raw', 'reviews_raw') }}
)
SELECT
    listing_id,
    date AS review_date,
    reviewer_name,
    comments AS review_text,
    sentiment AS review_sentiment
FROM
    raw_reviews