{{ config(
    materialized='incremental',
    on_schema_change='fail',
    partition_by={
        "field": "review_date",
        "data_type": "timestamp"
    },
    cluster_by=["listing_id"]
) }}

WITH src_reviews AS (
    SELECT * FROM {{ ref('src_reviews') }}
)
SELECT
    {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
    listing_id,
    review_date,
    reviewer_name,
    review_text,
    review_sentiment
FROM
    src_reviews
WHERE review_text IS NOT NULL
{% if is_incremental() %}
    -- Only select rows that are newer than the most recent row in the table
    AND review_date > (SELECT MAX(review_date) FROM {{ this }})
{% endif %}