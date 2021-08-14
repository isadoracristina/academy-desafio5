with
    selected as (
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
            , is_discontinued

        from {{ ref('stg_products') }}
    )
    , transformed as (
        select
            row_number() over (order by product_id) as product_sk
            , *
            from selected
    )

select * from transformed
