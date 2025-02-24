with source as 
(
    select * 
    from {{ source("yt_comments", "staging_verbs") }}
)

select 
*
from source