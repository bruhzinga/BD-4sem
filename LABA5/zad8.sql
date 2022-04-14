-- Все студенты у которых есть хоть одна оценка выше средней
use UNIVER;
SELECT P.IDSTUDENT, P.SUBJECT, P.NOTE
From PROGRESS P
where P.IDSTUDENT IN(
select
    PP.IDSTUDENT
from PROGRESS PP
where PP.NOTE >= ANy( (select avg(PPP.NOTE)
from PROGRESS PPP  )
))
