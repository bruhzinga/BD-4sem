use UNIVER

--task4 (Неподтвержденное чтение)
-- A ---
set transaction isolation level READ UNCOMMITTED
select @@SPID
begin transaction
-------------------------- t1 ------------------
select * from SUBJECT where SUBJECT = 'NewSubject';
rollback tran;
--commit tran;
-------------------------- t2 -----------------
--- B ---

use UNIVER;
begin transaction
select @@SPID
insert SUBJECT values ('NewSubject', 'NS', 'ИСиТ');
-------------------------- t1 --------------------
-------------------------- t2 --------------------
rollback tran;
--commit tran;