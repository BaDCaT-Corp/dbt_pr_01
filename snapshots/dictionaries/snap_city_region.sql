{% snapshot snap_city_region %}

{{
    config(
        target_schema = 'snapshot',
        unique_key = 'city',
        strategy = 'timestamp',
        updated_at = 'updated_at',
        dbt_valid_to_current = "'9999-12-31'::date",
        hard_deletes = 'new_record',

        snapshot_meta_column_names = {
            "dbt_valid_from" : "wrt04zzzz",
            "dbt_valid_to" : "wrt05zzzz",
            "dbt_is_deleted" : "is_deleted"
        }
    )
}}
-- 'invalidate' - в поле _to добавляется время исключения (системное, не параметр)
-- 'ignore' - игнор удаления строки (строка останется в snap)
Select 
    city,
    region,
    country,
    updated_at 
from {{ref('city_region')}}

{% endsnapshot %}