
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
		print '��������� �����:' + convert(varchar, @ex2_cnt + 1);
	set @ex2_cnt = @ex2_cnt + 1;
end;

-- ����������� SELECT-������. �������� ���� ������� � ���������� ��� ���������. 
select * from #EX_2;
select count(*) as '���������� �����' from #EX_2;

-- ������� ������������������ ������������ ��������� ������. 
create index #EX2_NONCLU on #EX_2(t_ind, t_identity);

-- �� ������������ ��� ���������� � ����������:
select * from #EX_2 where t_ind > 15000 and t_identity < 4500
select * from #EX_2 order by t_ind, t_identity

-- ������������ ��� ������ �� ����������� ��������:
select * from #EX_2 where t_identity = 2804

-- ������� ��������� ������ ����������.

drop index #EX2_NONCLU on #EX_2
drop table #EX_2