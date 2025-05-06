{{
    config(
        materialized = 'table'
    )
}}

select
  "aircraft_code",
  "seat_no",
  "fare_conditions"

from {{ source('demo_src', 'seats') }}
    
--{% for rel in dbt_utils.get_relations_by_prefix("dwh_flight_01", 'stg_flights') %} 
  --{{ rel }}
--{% endfor %}