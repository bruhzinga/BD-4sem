use UNIVER
go
--4
-- Функция принимает один параметр, задающий код кафедры. Функция возвращает количество преподавателей на заданной параметром кафедре. Если параметр равен NULL, то возвращается общее количество преподавателей.

create function FCTEACHER(@pul nvarchar(10)) returns int as
    begin
        declare @count int=(select count(*) from TEACHER
        where PULPIT=isnull(@pul, PULPIT));
        return @count;
    end;
go
-- drop function FCTEACHER;

-- обращение к функции:
select PULPIT, dbo.FCTEACHER(PULPIT) [Количество преподавателей] from PULPIT;

select dbo.FCTEACHER(null) [Всего преподавателей];