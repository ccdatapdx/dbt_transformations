with source as 
(
    select * 
    from {{ source("yt_comments", "staging_orgs") }}
)

select 
*
from source