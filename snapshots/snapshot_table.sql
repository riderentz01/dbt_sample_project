{% snapshot incremental_snapshot %}

{{
    config(
      target_schema='public',
      unique_key='id',

      strategy='timestamp',
      updated_at='load_dt',
    )
}}

select * from {{ source('public', 'snapshot_table') }}

{% endsnapshot %}
