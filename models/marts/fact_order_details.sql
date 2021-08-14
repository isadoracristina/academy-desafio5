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
    orders_with_sk as (
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

    select * from orders_with_sk
