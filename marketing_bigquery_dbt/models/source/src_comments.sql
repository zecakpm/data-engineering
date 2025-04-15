WITH raw_comments AS (
  SELECT *
  FROM
    {{ source('marketing', 'comments') }}
)

SELECT
  CAST(comment_id AS INT64) AS comment_id,
  CAST(post_id AS INT64) AS post_id,
  CAST(user_id AS INT64) AS user_id,
  comment_text,
  created_at
FROM raw_comments
