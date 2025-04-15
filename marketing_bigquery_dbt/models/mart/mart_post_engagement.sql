SELECT
  fpo.post_id,
  fpo.user_id,
  user.username,
  user.full_name,
  user.is_verified,
  fpo.media_type,
  fpo.likes_count,
  fpo.comments_count,
  COUNT(DISTINCT user.user_id) AS total_users,
  COUNT(com.comment_id) AS total_comments,
  fpo.post_created_at,
  DATE(fpo.post_created_at) AS post_date
FROM {{ ref('fct_posts') }} fpo
  LEFT JOIN {{ ref('dim_users') }} user ON fpo.user_id = user.user_id
  LEFT JOIN {{ ref('fct_comments') }} com ON fpo.post_id = com.post_id
GROUP BY ALL
