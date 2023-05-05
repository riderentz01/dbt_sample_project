select
    id as new_id,
    cast(value as varchar(16)) as new_value,
    {{ dbt_utils.star(ref('addition_view')) }}
from {{ ref('addition_view') }}
