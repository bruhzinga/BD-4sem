create table #EX_3
	(t_ind int,
	t_identity int identity(1,1),
	t_field varchar(100));

set nocount on;
declare @ex3_cnt int = 0;
while (@ex3_cnt < 10000)
begin
	insert into #EX_3(t_ind, t_field) values (floor(30000*rand()), replicate('string3', 10));
	if ((@ex3_cnt + 1) % 1000 = 0) 
		print 'Добавлено строк:' + convert(varchar, @ex3_cnt + 1);
	set @ex3_cnt = @ex3_cnt + 1;
end;

select * from #EX_3;
select count(*) as 'Количество строк' from #EX_3;

create index #EX3_INCL on #EX_3(t_ind) include (t_identity)
select * from #EX_3 where t_ind > 20000 and t_identity <5000;


drop index #EX3_INCL on #EX_3
drop table #EX_3