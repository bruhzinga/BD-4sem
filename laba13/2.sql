use UNIVER;
go
--2
-- Разработать скалярную функцию с именем FSUBJECTS, принимающую параметр @p типа VARCHAR(20), значение которого задает код кафедры (столбец SUBJECT.PULPIT).
-- Функция должна возвращать строку типа VARCHAR(300) с перечнем дисциплин в отчете:
create function FSUBJECTS (@p nvarchar(20)) returns nvarchar(300) as
begin
    declare @list varchar(300) = 'Дисциплины: ', @sub varchar(20);
    declare SUBJECT_CURSOR cursor local for
    select SUBJECT.SUBJECT 'Дисциплина'
    from SUBJECT
    where SUBJECT.PULPIT = @p
    open SUBJECT_CURSOR
    fetch next from SUBJECT_CURSOR into @sub
    while @@FETCH_STATUS = 0
        begin
            set @list=@list+rtrim(@sub)+', ';
            fetch SUBJECT_CURSOR into @sub
        end;
    return @list;
end;
-- drop function FSUBJECTS;

print dbo.FSUBJECTS('ИСиТ');
-- обращение к функции:
select PULPIT 'Кафедра', dbo.FSUBJECTS(PULPIT) 'Дисциплины' from PULPIT;
go
