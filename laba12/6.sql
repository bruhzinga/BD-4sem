use UNIVER;
go
--6:
-- транзакция serializable; @tn для AUDITORIUM_TYPE.AUDITORIUM_TYPENAME
CREATE procedure PAUDITORIUM_INSERTX
		@a char(20),
		@n varchar(50),
		@c int = 0,
		@t char(10),
		@tn varchar(50)	--доп., для ввода в AUD_TYPEAUD_TYPENAME
as begin
DECLARE @rc int = 1;
begin try
	set transaction isolation level serializable;
	begin tran
	INSERT into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
				values(@n, @tn);
	EXEC @rc = PAUDITORIUM_INSERT @a, @n, @c, @t;
	commit tran;
	return @rc;
end try
begin catch
	print 'Номер ошибки: ' + cast(error_number() as varchar(6));
	print 'Сообщение: ' + error_message();
	print 'Уровень: ' + cast(error_severity() as varchar(6));
	print 'Метка: ' + cast(error_state() as varchar(8));
	print 'Номер строки: ' + cast(error_line() as varchar(8));
	if error_procedure() is not  null
	print 'Имя процедуры: ' + error_procedure();
	if @@trancount > 0 rollback tran ;
	return -1;
end catch;
end;


DECLARE @k3 int;
EXEC @k3 = PAUDITORIUM_INSERTX '652-3', @n = 'КГ', @c = 85, @t = '652-3', @tn = 'Комп. класс НОВЫЙ!!!';
print 'Код ошибки: ' + cast(@k3 as varchar(3));
    go


select * from AUDITORIUM;
select * from AUDITORIUM_TYPE;

delete AUDITORIUM where AUDITORIUM='622-3';
delete AUDITORIUM_TYPE where AUDITORIUM_TYPE='КГ';
go

drop procedure PAUDITORIUM_INSERTX;