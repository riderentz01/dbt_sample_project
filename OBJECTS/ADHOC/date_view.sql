select id, value
from {{ source('public', 'date_table') }}
where id > 5
