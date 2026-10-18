with dedup_query as (
    select *,
    ROW_NUMBER() over (partition by id order by updatedate desc) as dedeuplication_id
    from  {{ source('source', 'item') }}
)

select id,name,category,updatedate from dedup_query where dedeuplication_id =1