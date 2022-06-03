use UNIVER
go
--6
-- количество кафедр, количество групп, количество студентов и количество специальностей вычислялось отдельными скалярными функциями:

--drop function dbo.FACULTY_REPORT;
--drop function dbo.COUNT_PULPIT;
--drop function dbo.COUNT_GROUPS;
--drop function dbo.COUNT_PROFESSIONS;
create function COUNT_PULPIT(@faculty nvarchar(10)) returns int
as begin
    declare @rc int=0;
    set @rc=(select count(*) from PULPIT
        where PULPIT.FACULTY=@faculty)
    return @rc;
end;
----drop function COUNT_PULPIT;
go

create function COUNT_GROUPS(@faculty nvarchar(10)) returns int
as begin
    declare @rc int=0;
    set @rc=(select count(*) from GROUPS
        where GROUPS.FACULTY=@faculty)
    return @rc;
end;
--drop function COUNT_GROUPS;
go

create function COUNT_PROFESSION(@faculty varchar(20)) returns int
	as begin
		declare @rc int = 0;
		set @rc = (select count(*) from PROFESSION
			where PROFESSION.FACULTY = @faculty)
		return @rc;
	end;
--drop function COUNT_PROFESSION;
go

create function FACULTY_REPORT(@c int) returns @fr table
	([Факультет] varchar(50),
	[Количество кафедр] int,
	[Количество групп] int,
	[Количество студентов] int,
	[Количество специальностей] int)
	as begin
		declare cc cursor local static for
			select FACULTY from FACULTY where dbo.COUNT_STUDENTS(FACULTY.FACULTY) > @c;
		declare @f varchar(30);
		open cc;
			fetch cc into @f;
		while @@fetch_status = 0
			begin
				insert @fr values(
				@f,
				dbo.COUNT_PULPIT(@f),
	            dbo.COUNT_GROUPS(@f),
				dbo.COUNT_STUDENTS(@f),
				dbo.COUNT_PROFESSION(@f));
	            fetch cc into @f;
			end;
		close cc;
		deallocate cc;
		return;
	end;
go

select * from dbo.FACULTY_REPORT(0);
go
