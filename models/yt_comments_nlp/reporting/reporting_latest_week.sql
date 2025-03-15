with source as 
(
    select *
    from {{ ref("staging_pos_ner") }}
)

select
    video_ids,
    video_titles,
    entity_text,
    entity_type,
    sum(entity_count) as entity_count
from source
where ingestion_date = current_date()
group by video_ids, video_titles, entity_text, entity_type
order by video_ids desc