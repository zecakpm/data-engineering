WITH raw_users AS (
  SELECT *
  FROM
    {{ source('marketing', 'users') }}
)

SELECT
  CAST(user_id AS INT64) AS user_id,
  username,
  full_name,
  created_at,
  is_verified,
  follower_count,
  following_count
FROM raw_users
