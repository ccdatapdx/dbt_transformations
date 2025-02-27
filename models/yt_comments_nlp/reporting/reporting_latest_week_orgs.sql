with source as 
(
    select video_titles, ner_text, ent, ner_count, ingestion_date
    from {{ source("yt_comments", "staging_orgs") }}
)

select ner_text as entity, sum(ner_count) as entity_count
from source
where ingestion_date = current_date()
group by ner_text
order by entity_count desc
