SELECT
    comment_id,
    post_id,
    user_id,
    comment_text,
    created_at AS comment_created_at
FROM {{ ref('src_comments') }}