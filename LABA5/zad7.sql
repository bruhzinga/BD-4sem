---- Все студенты у которых наиболее высокие оценки
use UNIVER;
SELECT P.IDSTUDENT, P.SUBJECT, P.NOTE
From PROGRESS P
where P.IDSTUDENT IN(
select
    PP.IDSTUDENT
from PROGRESS PP
where PP.NOTE >= ALL( (select PPP.NOTE
from PROGRESS PPP  )
))
