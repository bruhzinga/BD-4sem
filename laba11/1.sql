use UNIVER
set nocount on
if  exists (select * from  SYS.OBJECTS
         where OBJECT_ID=object_id(N'DBO.TAB'))
	drop table TAB;
declare @c int, @flag char = 'r'; -- если с->r, таблица не сохр

SET IMPLICIT_TRANSACTIONS ON -- вкл режим не¤вной транзакции
	create table TAB(K int );
	insert TAB values (1),(2),(3),(4),(5);
	set @c = (select count(*) from TAB);
	print 'кол-во строк в TAB: ' + cast(@c as varchar(2));
	if @flag = 'c' commit  -- фиксаци¤
		else rollback;     -- откат
SET IMPLICIT_TRANSACTIONS OFF -- действует режим автофиксации


if  exists (select * from  SYS.OBJECTS
          where OBJECT_ID= object_id(N'DBO.TAB')) print 'таблица TAB есть';
else print 'таблицы TAB нет'