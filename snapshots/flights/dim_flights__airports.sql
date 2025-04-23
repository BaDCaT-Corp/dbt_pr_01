{% snapshot dim_flights__airports %}

{{
    config(
        target_schema = 'snapshot',
        unique_key = 'airport_code',
        strategy = 'check',
        check_cols = ['airport_name', 'city', 'coordinates', 'timezone'],
        dbt_valid_to_current = "'9999-12-31'::date",
    
        snapshot_meta_column_names = {
            "dbt_valid_from" : "wrt04zzzz",
            "dbt_valid_to" : "wrt05zzzz"
        }
    )


}} 

Select 
    airport_code,
    airport_name,
    city,
    coordinates,
    timezone
from {{ref('stg_flights__airports')}}

{% endsnapshot %}