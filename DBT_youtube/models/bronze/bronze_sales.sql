{{
  config(
    materialized = 'view',
    )
}}

{# block level configuration  #}
select 
*
from 
{{ source('source', 'fact_sales') }}