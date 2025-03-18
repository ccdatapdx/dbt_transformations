{{ config(
    schema='techmeme_nlp'
) }}

with source as (

    select 
    pub,
    headline,
    row_number() over (partition by headline) as row_num
    from {{ref("staging_weekly_reporting")}}
)

select pub, count(pub) as pub_count
from source
where row_num = 1
group by pub
order by pub_count desc