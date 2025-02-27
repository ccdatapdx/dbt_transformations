with source as 
(
    select * 
    from {{ source("yt_comments", "staging_people") }}
)

select ner_text as entity, sum(ner_count) as entity_count
from source
where ingestion_date = current_date()
group by ner_text
order by entity_count desc