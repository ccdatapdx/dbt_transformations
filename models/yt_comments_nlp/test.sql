with source as (select * from {{ source("yt_comments", "ner_data_Linus Tech Tips") }})

select date(video_dates) as new_date 

from source

where date(video_dates) = date_sub(current_date(), interval 2 day)

order by video_dates desc


