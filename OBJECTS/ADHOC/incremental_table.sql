{{
    config(
        materialized='incremental'
    )
}}

select {{ dbt_utils.star(source('public', 'int_table')) }}
from {{ source('public', 'int_table') }}
{% if is_incremental() %} -- If you don't have this, the incremental table does an insert and gives you a full copy of the table again, which is no bueno.
where id > (select max(id) from {{ this }})
{% endif %}