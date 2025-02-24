with source as 
(
    select * 
    from {{ source("yt_comments", "staging_products") }}
)

select 
*
from source