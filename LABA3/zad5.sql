use ZDA_MyBase;
update Группа set Количество_студентов = Количество_студентов+1; 
select * from Группа;
select Количество_часов,Оплата from Расценки ;
select count(*) as Количество from Расценки;
select distinct top(3) Специальность Крутые from Группа where Специальность = 'ПОИТ';
