use UNIVER

declare @point varchar(32);

begin try
	begin tran
		set @point = 'p1';
		save tran @point;  -- контрольная точка p1
		insert STUDENT(IDGROUP, NAME, BDAY, INFO, FOTO) values
		                      (20,'Екатерина', '1997-08-02', NULL, NULL),
							  (20,'Александра', '1997-08-06', NULL, NULL),
							  (20,'Елизавета', '1997-08-01', NULL, NULL),
							  (20,'Ольга', '1997-08-03', NULL, NULL);
		set @point = 'p2';
		save tran @point; -- контрольная точка p2
		insert STUDENT(IDGROUP, NAME, BDAY, INFO, FOTO) values
							  (21, 'Особенный Студент', '1997-08-02', NULL, NULL);
	commit tran;
end try

begin catch
	print 'ошибка: '+ case
		when error_number() = 2627 and patindex('%STUDENT_PK%', error_message()) > 0 then 'дублирование студента'
		else 'неизвестная ошибка: '+ cast(error_number() as  varchar(5)) + error_message()
	end;
    if @@trancount > 0 -- если транзакция не завершена
	begin
	   print 'контрольная точка: '+ @point;
	   rollback tran @point; -- откат к последней контр.точке
	   commit tran; -- фиксация изменений, выполн до контр.точки
	end;
end catch;

select * from STUDENT where IDGROUP=20;
delete STUDENT where IDGROUP=20;