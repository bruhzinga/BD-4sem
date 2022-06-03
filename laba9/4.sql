--4:
-- —оздать и заполнить временную локальную таблицу. 
create table #EX_4
	(t_rnd int,
	t_identity int identity(1,1),
	t_field varchar(100));

set nocount on;
declare @ex4_cnt int = 0;
while (@ex4_cnt < 10000)
begin
	insert into #EX_4(t_rnd, t_field) values (floor(30000*rand()), replicate('string4', 10));
	if ((@ex4_cnt + 1) % 1000 = 0) 
		print 'ƒобавлено строк:' + convert(varchar, @ex4_cnt + 1);
	set @ex4_cnt = @ex4_cnt + 1;
end;

-- –азработать SELECT-запрос, получить план запроса и определить его стоимость.
select * from #EX_4 where t_rnd between 7432 and 10385;
select * from #EX_4 where t_rnd > 24862;
select count(*) as ' оличество строк' from #EX_4;

-- —оздать некластеризованный фильтруемый индекс, уменьшающий стоимость SELECT-запроса.
create index #EX4_FILTER1 on #EX_4(t_rnd) where (t_rnd >= 15000 and t_rnd <= 17000)

drop index #EX4_FILTER1 on #EX_4
drop table #EX_4