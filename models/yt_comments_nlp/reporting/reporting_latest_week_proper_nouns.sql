with source as 
(
    select * 
    from {{ source("yt_comments", "staging_proper_nouns") }}
)

select 
*
from source