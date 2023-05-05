{{ config(materialized='table') }}

select
    coalesce(a.id, b.id) as id
    , coalesce(a.value, 0) + coalesce(b.value, 0) as value
    , b.value as float_value
from {{ source('public', 'int_table') }} a
full outer join {{ source('public', 'float_table') }} b
on a.id = b.id
