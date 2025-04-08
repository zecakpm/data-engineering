SELECT
    p.post_id,
    p.user_id,
    u.username,
    u.full_name,
    u.is_verified,
    p.media_type,
    p.likes_count,
    p.comments_count,
    COUNT(c.comment_id) AS total_comments,
    p.post_created_at,
    DATE(p.post_created_at) AS post_date
FROM {{ ref('fct_posts') }} p
LEFT JOIN {{ ref('dim_users') }} u ON p.user_id = u.user_id
LEFT JOIN {{ ref('fct_comments') }} c ON p.post_id = c.post_id
GROUP BY
    p.post_id, p.user_id, u.username, u.full_name, u.is_verified,
    p.media_type, p.likes_count, p.comments_count,
    p.post_created_at