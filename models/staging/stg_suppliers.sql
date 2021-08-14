with
    source as (
        select
            supplier_id
            		
            , country	
            , city	
            , fax	
            , postal_code	
            , homepage		
            , address	
            , region		
            , contact_name	
            , phone	
            , company_name	
            , contact_title

            , _sdc_table_version	
            , _sdc_batched_at	
            , _sdc_received_at	
            , _sdc_sequence

        from {{ source('northwind_el', 'suppliers') }}
    )

select * from source
