use UNIVER
go
create function GETALLMARKS_F(@predmet varchar(20), @kafedra varchar(20)) returns nvarchar(300)
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


		close GRADES;
		deallocate GRADES;
        return rtrim(@grade_list);
    end;

go


print  dbo.GETALLMARKS_F(N'СУБД', N'ЛХФ');



select  distinct  FACULTY[Факультет] ,SUBJECT[Предмет],dbo.GETALLMARKS_F(SUBJECT,FACULTY)[ОЦЕНКИ]
                        from PROGRESS
                        inner join dbo.STUDENT S on S.IDSTUDENT = PROGRESS.IDSTUDENT
                        inner join dbo.GROUPS G on G.IDGROUP = S.IDGROUP

