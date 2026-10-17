with sales as (
    select sales_id, product_sk, customer_sk, payment_method, {{ multiply('unit_price','quantity') }} as cal_gross_amount
    from {{ ref('bronze_sales') }}
),
product as (
    select product_sk,category 
    from {{ ref('bronze_product') }}
),
customer as(
    select customer_sk,gender
    from {{ ref('bronze_customer') }}

),
joined_query  as(

select 
    sales.sales_id,
    sales.payment_method,
    sales.cal_gross_amount,
    product.category,
    customer.gender
from sales
join
product on sales.product_sk = product.product_sk 
join
customer on sales.customer_sk = customer.customer_sk
)

select category,gender,sum(cal_gross_amount) as total_sales
from joined_query
group by 
category,gender
order by
total_sales desc