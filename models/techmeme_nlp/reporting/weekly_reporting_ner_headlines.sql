{{ config(
    schema='techmeme_nlp'
) }}

with source as (

    select *
    from {{ref("staging_weekly_reporting")}}
)

select
ner_headlines,
count(ner_headlines) as ner_count,
from source
group by ner_headlines
order by ner_count desc