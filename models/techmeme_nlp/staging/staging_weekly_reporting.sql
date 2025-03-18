{{ config(
    schema='techmeme_nlp'
) }}


with source as (

    select news_date, headline, author, pub, ner_headlines, ner_type
    from {{ref("staging_techmeme_ner")}}
    where news_date between {{ dbt_date.n_days_ago(7, tz="America/Los_Angeles") }} AND {{ dbt_date.today("America/Los_Angeles") }}
)

select *
from source
