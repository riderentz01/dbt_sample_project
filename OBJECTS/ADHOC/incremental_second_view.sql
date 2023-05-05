{{
    config(
        materialized='table'
    )
}}

select {{ dbt_utils.star(ref('incremental_table')) }}
from {{ ref('incremental_table') }}