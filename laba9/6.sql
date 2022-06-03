create index #ex6_key on #ex5(t_ind) with (fillfactor = 65)
insert top (50) percent into #ex5(t_ind, t_field) select t_ind, t_field from #ex5

select name [Index],
       avg_fragmentation_in_percent [fragmentation %]
from sys.dm_db_index_physical_stats (DB_ID('TEMPDB'),
    OBJECT_ID('#ex6_key'), null, null, null) ss
join sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id
where name is not null

drop index #ex5_key on #ex5
drop index #ex6_key on #ex5
drop table #ex5