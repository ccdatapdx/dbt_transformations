with source as 
(
    select * 
    from {{ source("yt_comments", "pos_data_Linus Tech Tips") }}
)

select 
*,
current_date() as ingestion_date
from source
where pos="PROPN"