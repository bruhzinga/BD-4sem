use UNIVER;
go

--1
-- Разработать скалярную функцию с именем COUNT_STUDENTS, которая вычисляет количество студентов на факультете:
create function COUNT_STUDENTS (@faculty nvarchar(20)) returns int as
begin
    declare @count int=0;
    set @count=(select count(STUDENT.IDSTUDENT)
    from FACULTY
	inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
	inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	where FACULTY.FACULTY = @faculty)
    return @count;
end;
go
--drop function COUNT_STUDENTS;

declare @temp_1 int = dbo.COUNT_STUDENTS('ИЭФ');
print 'Количество студентов на факультете ' +cast(@temp_1 as nvarchar(20))+ ' человек.';

select FACULTY 'Факультет',
	dbo.COUNT_STUDENTS(FACULTY) 'Кол-во студентов'
from FACULTY
go

-- Внести изменения в текст функции с помощью оператора ALTER с тем, чтобы функция принимала второй параметр @prof:
alter function COUNT_STUDENTS (@faculty nvarchar(20), @prof nvarchar(20)) returns int as
begin
    declare @count int=0;
    set @count=(select count(STUDENT.IDSTUDENT)
    from FACULTY
    inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
    inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
    where FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = @prof)
    return @count;
end;
go

declare @temp_1 int = dbo.COUNT_STUDENTS('ИЭФ', '1-25 01 07');
print 'Количество студентов: ' + convert(varchar, @temp_1);

select FACULTY.FACULTY 'Факультет',
	GROUPS.PROFESSION 'Специальность',
	dbo.COUNT_STUDENTS(FACULTY.FACULTY, GROUPS.PROFESSION) 'Кол-во студентов'
from FACULTY
	inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
group by FACULTY.FACULTY, GROUPS.PROFESSION
go







