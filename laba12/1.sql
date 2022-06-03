
use UNIVER;
go

--1:
-- хранимая процедура без параметров, формирует результирующий набор на основе таблицы SUBJECT
create procedure PSUBJECT
as
begin
declare @k int=(select COUNT(*) from SUBJECT);
select SUBJECT [КОД], SUBJECT_NAME [ДИСЦИПЛИНА], PULPIT [КАФЕДРА] from SUBJECT;
return @k;
end;
--DROP procedure PSUBJECT;

declare @i int=0;
exec @i=PSUBJECT;
print 'Количество предметов: '+cast(@i as varchar(3));
