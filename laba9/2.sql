
create table #EX_2 
	(t_ind int,
	t_identity int identity(1,1),
	t_field varchar(100));

	

set nocount on;
declare @ex2_cnt int = 0;
while (@ex2_cnt < 10000)
begin
	insert into #EX_2(t_ind, t_field) values (floor(30000*rand()), replicate('string2', 10));
	if ((@ex2_cnt + 1) % 1000 = 0) 
		print 'Добавлено строк:' + convert(varchar, @ex2_cnt + 1);
	set @ex2_cnt = @ex2_cnt + 1;
end;

-- Разработать SELECT-запрос. Получить план запроса и определить его стоимость. 
select * from #EX_2;
select count(*) as 'Количество строк' from #EX_2;

-- Создать некластеризованный неуникальный составной индекс. 
create index #EX2_NONCLU on #EX_2(t_ind, t_identity);

-- не используется при фильтрации и сортировке:
select * from #EX_2 where t_ind > 15000 and t_identity < 4500
select * from #EX_2 order by t_ind, t_identity

-- используется при поиске по конкретному значению:
select * from #EX_2 where t_identity = 2804

-- Оценить процедуры поиска информации.

drop index #EX2_NONCLU on #EX_2
drop table #EX_2