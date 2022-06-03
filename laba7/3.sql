
use UNIVER;
GO
create VIEW [Аудитории] as
select A.AUDITORIUM[КОД],A.AUDITORIUM_NAME[Наименование аудитории]
From AUDITORIUM A
where A.AUDITORIUM_TYPE ='ЛК'

use UNIVER
go

use UNIVER;
insert into [Аудитории]([Код],[Наименование аудитории]) values (315,'315');
update [Аудитории] set [Код] = 311 where [Наименование аудитории] = '310';
delete from [Аудитории] where [Наименование аудитории] = '310';

select * from [Аудитории]
