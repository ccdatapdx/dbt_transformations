{{ config(
    schema='techmeme_nlp'
) }}

with source as (

    select 
    author,
    headline,
    row_number() over (partition by headline) as row_num
    from {{ref("staging_weekly_reporting")}}
)

select author, count(author) as author_count
from source
where row_num = 1 and author is not NULL
group by author
order by author_count desc
