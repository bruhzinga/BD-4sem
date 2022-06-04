use UNIVER
--task7 (проблемы изолированности решены)
-- A ---
set transaction isolation level SERIALIZABLE
begin transaction
select * from SUBJECT;
-------------------------- t1 -----------------
-------------------------- t2 ------------------
select * from SUBJECT;
commit tran;
--- B ---
begin transaction
-------------------------- t1 --------------------
--delete from SUBJECT where SUBJECT_NAME = 'Task'
insert SUBJECT values ('NewSubj', 'NSubj', 'ИСиТ');
update SUBJECT set SUBJECT = 'Task' where PULPIT = 'Task'
commit tran;
-------------------------- t2 --------------------