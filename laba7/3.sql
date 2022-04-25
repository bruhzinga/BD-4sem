
use UNIVER;
GO
create VIEW [Аудитории] as
select A.AUDITORIUM[КОД],A.AUDITORIUM_NAME[Наименование аудитории]
From AUDITORIUM A
where A.AUDITORIUM_TYPE ='ЛК'

use UNIVER
go

insert into [Аудитории]([Код],[Наименование аудитории]) values (310,'310');
update [Аудитории] set [Код] = 311 where [Наименование аудитории] = '310';
delete from [Аудитории] where [Наименование аудитории] = '310';

