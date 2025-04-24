{% snapshot snap_gripp %}

{{
    config(
        target_schema = 'snapshot',
        unique_key = 'air_waybill_number',
        strategy = 'check',
        check_cols = ["date_of_sale",
            "date_of_flight",
            "flight_number",
            "cargo_transportation_route",
            "physical_weight",
            "volume",
            "volume_weight",
            "paid_weight",
            "currency_of_sale",
            "air_fare",
            "air_fare_1",
            "rfs",
            "rfs_1",
            "total_amount",
            "agency_commission",
            "agency_commission_1",
            "fees_total",
            "type_of_cargo",
            "transfer_point",
            "product_code",
            "additional_product_code",
            "shc_code",
            "inn",
            "kpp",
            "note",
            "the_counterparty_to_the_inn_from_fwb"],
        dbt_valid_to_current = "'9999-12-31'::date",
        hard_deletes = 'new_record',

        snapshot_meta_column_names = {
            "dbt_valid_from" : "wrt04zzzz",
            "dbt_valid_to" : "wrt05zzzz",
            "dbt_is_deleted" : "is_deleted"
        }
    )
}}

Select 
    "air_waybill_number",
    "date_of_sale",
    "date_of_flight",
    "flight_number",
    "cargo_transportation_route",
    "physical_weight",
    "volume",
    "volume_weight",
    "paid_weight",
    "currency_of_sale",
    "air_fare",
    "air_fare_1",
    "rfs",
    "rfs_1",
    "total_amount",
    "agency_commission",
    "agency_commission_1",
    "fees_total",
    "myc",
    "myc_1",
    "type_of_cargo",
    "transfer_point",
    "product_code",
    "additional_product_code",
    "shc_code",
    "inn",
    "kpp",
    "note",
    "the_counterparty_to_the_inn_from_fwb"
from {{ref('sap_orig')}}

{% endsnapshot %}