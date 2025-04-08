{% snapshot scd_raw_listings %}

{{
   config(
       target_schema='airbnb_raw',
       unique_key='id',
       strategy='timestamp',
       updated_at='updated_at',
       ivalidate_hard_delete='true'
   )
}}

SELECT * FROM {{ source('airbnb_raw', 'listings_raw') }}

{% endsnapshot %}