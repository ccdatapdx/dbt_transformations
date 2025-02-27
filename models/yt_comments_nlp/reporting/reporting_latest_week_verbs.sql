with source as 
(
    select * 
    from {{ source("yt_comments", "staging_verbs") }}
)

select pos_text as entity, sum(pos_count) as entity_count
from source
where ingestion_date = current_date()
group by pos_text
order by entity_count desc