use UNIVER

alter PROCEDURE   [dbo].[GETALLMARKS] @predmet varchar(20), @kafedra varchar(20)
as
    begin

        	declare @grade_list char(300) = '', @grade char(10);
		declare GRADES cursor for
			select NOTE
                        from PROGRESS
                        inner join dbo.STUDENT S on S.IDSTUDENT = PROGRESS.IDSTUDENT
                        inner join dbo.GROUPS G on G.IDGROUP = S.IDGROUP
                   where SUBJECT=@predmet And FACULTY =@kafedra
		open GRADES;
			fetch GRADES into @grade;
			while (@@FETCH_STATUS = 0)
				begin
					set @grade_list = rtrim(@grade) + ', ' + @grade_list;

					fetch GRADES into @grade;
				end;
			print 'Дисциплины на кафедре ' + rtrim(@kafedra) + ':';
			print rtrim(@grade_list);
		close GRADES;
		deallocate GRADES;
	end;


exec GETALLMARKS 'СУБД','ЛХФ'



