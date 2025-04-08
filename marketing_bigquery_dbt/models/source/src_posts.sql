WITH raw_posts AS (
    SELECT
        *
    FROM
       {{ source('marketing', 'posts') }}
)

SELECT
    CAST(post_id AS INT64) AS post_id,
    CAST(user_id AS INT64) AS user_id,
    caption,
    media_type,
    likes_count,
    comments_count,
    created_at
FROM raw_posts