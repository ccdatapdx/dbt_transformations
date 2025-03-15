with source as 
(
    select * 
    from {{ ref("staging_products") }}
)

select ner_text as entity, sum(ner_count) as entity_count
from source
where ingestion_date = current_date()
group by ner_text
order by entity_count desc