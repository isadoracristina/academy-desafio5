with
    source as (
        select
            order_id	
            , customer_id	
            , employee_id	

            , ship_region	
            , shipped_date
            , ship_country
            , ship_name
            , order_date	
            , ship_postal_code	
            , ship_city	
            , freight
            , ship_via as ship_id	
            , cast(required_date as timestamp) as required_date	
            , ship_address	

            , _sdc_table_version	
            , _sdc_batched_at	
            , _sdc_received_at	
            , _sdc_sequence

        from {{ source('northwind_el', 'orders') }}
    )

select * from source
