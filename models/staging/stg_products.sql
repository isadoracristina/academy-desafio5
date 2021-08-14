with
    source as (
        select
            product_id

            , supplier_id			
            , category_id

            , product_name	
            , unit_price	
            , quantity_per_unit	
            , units_in_stock	
            , units_on_order	
            , reorder_level
            , 
                case 
                    when discontinued = 1 then True
                    else False
                end as is_discontinued
                		

            , _sdc_table_version	
            , _sdc_batched_at	
            , _sdc_received_at	
            , _sdc_sequence

        from {{ source('northwind_el', 'products') }}
    )

select * from source
