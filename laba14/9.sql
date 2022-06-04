use UNIVER
-- task 9 (Запретить операции с таблицей)

go
create trigger DDL_UNIVER on database
for DDL_DATABASE_LEVEL_EVENTS
as
raiserror('Операции с БД запрещены', 10, 1);
rollback;
return;

delete FACULTY where FACULTY = 'ИДиП'
insert FACULTY values ('ЛВВ', 'test');
