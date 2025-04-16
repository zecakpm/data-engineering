{# test user #}
SELECT
  user_id,
  username,
  full_name,
  is_verified,
  follower_count,
  following_count,
  created_at AS user_created_at
FROM {{ ref('src_users') }}