Use UNIVER;
go
Create VIEW [Лекционные_аудитории] AS
select A.AUDITORIUM[КОД],A.AUDITORIUM_NAME[наименование аудитории]
from AUDITORIUM A
where A.AUDITORIUM_TYPE ='ЛК' WITH CHECK OPTION ;

use UNIVER;
insert into [Лекционные_аудитории]([Код],[Наименование аудитории]) values (310,'310');
update [Лекционные_аудитории] set [Код] = 311 where [Наименование аудитории] = '310';
delete from [Лекционные_аудитории] where [Наименование аудитории] = '310';