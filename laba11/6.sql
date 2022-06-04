use UNIVER
--task6 (фантомное чтение)
-- A ---
set transaction isolation level REPEATABLE READ
begin transaction
select count(*) from SUBJECT where SUBJECT = 'NewSubject';
-------------------------- t1 ------------------
-------------------------- t2 -----------------
select count(*) from SUBJECT where SUBJECT = 'NewSubject';
commit tran;

--- B ---
begin transaction
-------------------------- t1 --------------------
--delete from SUBJECT where SUBJECT = 'NewSubject';
insert SUBJECT values ('NewSubject', 'NS', 'ИСиТ');
commit tran;