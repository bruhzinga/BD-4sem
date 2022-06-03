use UNIVER;
go

-- вывести дисциплины на кафедре через запятую:
create procedure SUBJECT_REPORT @p char(10)
  as declare @rc int = 0;
	begin try
		if not exists (select SUBJECT from SUBJECT where PULPIT = @p)
			raiserror('Ошибка в параметрах', 11, 1);
		declare @subs_list char(300) = '', @sub char(10);
		declare SUBJECTS_LAB12 cursor for
			select SUBJECT from SUBJECT where PULPIT = @p;
		open SUBJECTS_LAB12;
			fetch SUBJECTS_LAB12 into @sub;
			while (@@FETCH_STATUS = 0)
				begin
					set @subs_list = rtrim(@sub) + ', ' + @subs_list;
					set @rc += 1;		--шаг
					fetch SUBJECTS_LAB12 into @sub;
				end;
			print 'Дисциплины на кафедре ' + rtrim(@p) + ':';
			print rtrim(@subs_list);
		close SUBJECTS_LAB12;
		deallocate SUBJECTS_LAB12;
		return @rc;
	end try
	begin catch
		print 'Номер ошибки: ' + convert(varchar, error_number());
		print 'Сообщение: ' + error_message();
		print 'Уровень: ' + convert(varchar, error_severity());
		print 'Метка: ' + convert(varchar, error_state());
		print 'Номер строки: ' + convert(varchar, error_line());
		if error_procedure() is not null
			print 'Имя процедуры: ' + error_procedure();
		return @rc;
	end catch;
go
--drop procedure SUBJECT_REPORT

declare @temp_5 int;
exec @temp_5 = SUBJECT_REPORT 'ИСиТ';
print 'Количество дисциплин: ' + convert(varchar, @temp_5);
go
