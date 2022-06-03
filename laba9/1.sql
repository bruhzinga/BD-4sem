use UNIVER;

go

--1:
-- Oпределить все индексы, которые имеются в БД:
exec SP_HELPINDEX AUDITORIUM;
exec SP_HELPINDEX AUDITORIUM_TYPE;
exec SP_HELPINDEX FACULTY;
exec SP_HELPINDEX GROUPS;
exec SP_HELPINDEX PROFESSION;
exec SP_HELPINDEX PROGRESS;
exec SP_HELPINDEX PULPIT;
exec SP_HELPINDEX STUDENT;
exec SP_HELPINDEX SUBJECT;
exec SP_HELPINDEX TEACHER;
exec SP_HELPINDEX TIMETABLE;

use UNIVER;
-- Создать временную локальную таблицу. Заполнить ее данными (не менее 1000 строк).
create table #EX_1
    (
        TINT int,
        TFIELD varchar(100)
);

use UNIVER;
set nocount on; -- не выводить сообщения о вводе строк;
declare @i int=0;
while @i<1000
begin
    insert #EX_1 (TINT, TFIELD)
    values (floor(20000*RAND()),REPLICATE('строка', 10));
    if (@i%100=0) print @i; -- вывести сообщение;
    set @i=@i+1;
end;

-- Разработать SELECT-запрос. Получить план запроса и определить его стоимость:
SELECT * FROM #EX_1 where TINT between 1500 and 2500 order by TINT;

checkpoint;  --фиксация БД
DBCC DROPCLEANBUFFERS;  --очистить буферный кэш

-- Cоздание кластеризованного индекса:
CREATE clustered index #EX_1_CL on #EX_1(TINT asc)

Drop table #EX_1;
Drop index #EX_1_CL on #EX_1

