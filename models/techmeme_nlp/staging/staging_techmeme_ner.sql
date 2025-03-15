{{ config(
    schema='techmeme_nlp'
) }}


with source as (

    select *

    from {{ source("techmeme_headlines","techmeme_ner") }}
)

select *
from source