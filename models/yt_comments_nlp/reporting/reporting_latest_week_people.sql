with source as 
(
    select * 
    from {{ source("yt_comments", "staging_people") }}
)

select 
*
from source