use UNIVER;
-- #5:
-- Создать курсор, демонстрирующий применение конструкции CURRENT OF в секции WHERE с использованием операторов UPDATE и DELETE:

insert into FACULTY (FACULTY, FACULTY_NAME)
values ('Test', 'testing current of');

declare EX_5_CURRENT cursor local scroll dynamic for select FACULTY, FACULTY_NAME from FACULTY for update;
declare @fac varchar(5), @full varchar(50);
open EX_5_CURRENT
fetch first from EX_5_CURRENT into @fac, @full;
		print @fac + ' ' + @full;
		update FACULTY set FACULTY = 'NEW' where current of EX_5_CURRENT;
		fetch first from EX_5_CURRENT into @fac, @full;
		print @fac + ' ' + @full;
		--delete FACULTY where current of EX_5_CURRENT;
	close EX_5_CURRENT;
go

select * from FACULTY;