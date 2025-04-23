{{
    config(
        materialized = 'table',
        meta = {
            'owner': 'kurdinivan@gmail.com'
        }
    )
}}
select
  airport_code,
  airport_name,
  city,
  coordinates,
  timezone
from
    {{ ref('stg_flights__airports') }}