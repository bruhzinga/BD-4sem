use UNIVER
begin try
	begin tran                 -- начало  явной транзакции
		insert FACULTY values ('ИТ', 'Факультет других наук');
	    insert FACULTY values ('ПиМ', 'Факультет print-технологий');
	commit tran;               -- фиксация транзакции
end try

begin catch
	print 'ошибка: '+ case
		when error_number() = 2627 and patindex('%FACULTY_PK%', error_message()) > 0 then 'дублирование '	--позиция 1-го вхождения
		else 'неизвестная ошибка: '+ cast(error_number() as  varchar(5))+ error_message()
	end;
	if @@trancount > 0 rollback tran; -- ур.вложенности тр.>0,  транз не завершена
end catch;

DELETE FACULTY WHERE FACULTY = 'ДФ';
DELETE FACULTY WHERE FACULTY = 'ПиМ';

select * from FACULTY;