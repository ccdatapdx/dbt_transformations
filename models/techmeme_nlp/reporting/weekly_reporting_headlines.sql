{{ config(
    schema='techmeme_nlp'
) }}

with source as (

    select *
    from {{ref("staging_weekly_reporting")}}
)

select
distinct(headline) as headline,
cast(news_date as string format 'MM-DD-YYYY' ) as news_date,
from source