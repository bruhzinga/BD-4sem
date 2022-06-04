use UNIVER;
go;
--4:
-- Процедура 4 вх.парам (значения столбцов), доб. строку в табл.AUDITORIUM
create procedure PAUDITORIUM_INSERT
	@a char(20),
	@n varchar(50),
	@c int=0,
	@t char(10)
as
begin try
insert into AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
values (@a, @n, @c, @t)
return 1;
end try
begin catch
	print 'Номер ошибки: ' + cast(error_number() as varchar(6));
	print 'Сообщение: ' + error_message();
	print 'Уровень: ' + cast(error_severity() as varchar(6));
	print 'Метка: ' + cast(error_state() as varchar(8));
	print 'Номер строки: ' + cast(error_line() as varchar(8));
	if error_procedure() is not null
	print 'Имя процедуры: ' + error_procedure();
	return -1;
end catch;

-- удалить процедуру:
drop procedure PAUDITORIUM_INSERT;
go


DECLARE @rc int;
exec @rc=PAUDITORIUM_INSERT @a='500-1', @n='ЛК', @c=60, @t='500-1';
print 'Код ошибки: '+cast(@rc as varchar(3));

-- удалить добавленную строку:
delete AUDITORIUM where AUDITORIUM='500-1';

-- просмотреть все аудитории:
select * from AUDITORIUM;