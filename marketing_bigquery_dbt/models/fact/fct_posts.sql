SELECT
  post_id,
  user_id,
  media_type,
  likes_count,
  comments_count,
  created_at AS post_created_at
FROM {{ ref('src_posts') }}
