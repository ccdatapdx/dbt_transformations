with ner_source as 
(
    select  video_ids,
            video_titles,
            ner_text as entity_text,
            ent as entity_type,
            ner_count as entity_count,
            current_date() as ingestion_date 
    from {{ source("yt_comments", "ner_data_Linus Tech Tips") }}
        
),

pos_source as 
(
    select video_ids,
           video_titles,
           pos_text as entity_text,
           pos as entity_type,
           pos_count as entity_count,
           current_date() as ingestion_date
    from {{ source("yt_comments", "pos_data_Linus Tech Tips") }}
)

select * from ner_source
union all
select * from pos_source