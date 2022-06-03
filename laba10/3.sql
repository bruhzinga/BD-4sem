use UNIVER;
-- #3:
-- отличие статических курсоров от динамических:

declare @pul char(10), @gen char(2), @name char(30);
declare Teachers cursor LOCAL dynamic for select PULPIT, GENDER, TEACHER_NAME from TEACHER where PULPIT='ИСиТ';
open Teachers;
print 'Количество строк: '+cast(@@CURSOR_ROWS as varchar(5));
insert into TEACHER values ('ПТИ', 'Пётор', 'м', 'ИСиТ');
		update TEACHER set TEACHER_NAME = 'Пётор Толстой Иванович' where TEACHER = 'КВД';
fetch Teachers into @pul, @gen, @name;
print 'Преподаватель: '+rtrim(@pul)+' '+rtrim(@gen)+' '+rtrim(@name);
while @@FETCH_STATUS=0
begin
    fetch Teachers into @pul, @gen, @name;
    print 'Преподаватель: '+rtrim(@pul)+' '+rtrim(@gen)+' '+rtrim(@name);
end;
    close Teachers;
    delete TEACHER where TEACHER = 'КВД';