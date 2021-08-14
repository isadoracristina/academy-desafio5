with
    source as (
        select
            employee_id	
            
            , country
            , city
            , postal_code
            , hire_date
            , extension
            , address
            , cast(birth_date as timestamp) as birth_date
            , region
            , photo_path
            , last_name
            , first_name
            , title
            , title_of_courtesy
            , notes
            , home_phone
            , reports_to	

            , _sdc_table_version	
            , _sdc_batched_at	
            , _sdc_received_at	
            , _sdc_sequence

        from {{ source('northwind_el', 'employees') }}
    )

select * from source
