{{ config(
    schema='techmeme_nlp'
) }}

with source as (

    select *
    from {{ref("staging_weekly_reporting")}}
)

select distinct(headline) as headline, news_date from source