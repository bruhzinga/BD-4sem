use UNIVER
go
--3
-- Разработать табличную функцию FFACPUL, результаты работы которой продемонстрированы на рисунке ниже.
-- Функция принимает два параметра, задающих код факультета (столбец FACULTY.FACULTY) и код кафедры (столбец PULPIT.PULPIT). Использует SELECT-запрос c левым внешним соединением между таблицами FACULTY и PULPIT:
create function FFACPUL(@fac varchar(10), @pul varchar(10)) returns table
    as return
    select FACULTY.FACULTY, PULPIT.PULPIT
    from FACULTY left outer join PULPIT
    on FACULTY.FACULTY = PULPIT.FACULTY
where FACULTY.FACULTY=isnull(@fac, FACULTY.FACULTY) and PULPIT.PULPIT=isnull(@pul, PULPIT.PULPIT);
go
--drop function dbo.FFACPUL;

select * from dbo.FFACPUL(null,null);
select * from dbo.FFACPUL('ИЭФ',null);
select * from dbo.FFACPUL(null,'ИСиТ');
select * from dbo.FFACPUL('ТТЛП','ЛМиЛЗ');
select * from dbo.FFACPUL('no','no');
go
