select {{ dbt_utils.star(source('public', 'int_table')) }}
from {{ source('public', 'int_table') }}
{% if is_incremental() %}
where id > (select max(id) from {{ this }})
{% endif %}