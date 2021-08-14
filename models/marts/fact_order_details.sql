with
    customers as (
        select *
        from {{ ref('dim_customers')}}
    ),
    employees as (
        select *
        from {{ ref('dim_employees')}}
    ),
    products as (
        select *
        from {{ ref('dim_products')}}
    ),
    suppliers as (
        select *
        from {{ ref('dim_suppliers')}}
    ),
    order_with_sk as (
        select
            order_id
            , customers.customer_sk as customer_fk
            , employees.employee_sk as employee_fk

            , orders.ship_region
            , orders.shipped_date
            , orders.ship_country
            , orders.ship_name
            , orders.order_date
            , orders.ship_postal_code
            , orders.ship_city
            , orders.freight
            , orders.required_date
            , orders.ship_address

        from {{ ref('stg_orders')}} as orders
        left join employees on orders.employee_id = employees.employee_id
        left join customers on orders.customer_id = customers.customer_id
    )
    , order_detail_with_sk as (
        select
            order_detail.order_id
            , products.product_sk as product_fk
            , order_detail.discount
            , order_detail.unit_price
            , order_detail.quantity
            from {{ ref('stg_order_details')}} as order_detail
            left join products on order_detail.product_id = products.product_id
    )
    , final as (
        select
            order_detail_with_sk.order_id
            , order_with_sk.customer_fk
            , order_with_sk.employee_fk

            , order_with_sk.ship_region
            , order_with_sk.shipped_date
            , order_with_sk.ship_country
            , order_with_sk.ship_name
            , order_with_sk.order_date
            , order_with_sk.ship_postal_code
            , order_with_sk.ship_city
            , order_with_sk.freight
            , order_with_sk.required_date
            , order_with_sk.ship_address
            , order_detail_with_sk.product_fk
            , order_detail_with_sk.discount
            , order_detail_with_sk.unit_price
            , order_detail_with_sk.quantity
            from order_with_sk
            left join order_detail_with_sk on order_with_sk.order_id = order_detail_with_sk.order_id

    )

    select * from final
