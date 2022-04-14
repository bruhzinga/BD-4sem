use UNIVER;
select s.NAME, s.BDAY
from STUDENT s
where s.BDAY IN
(
select s.BDAY
from STUDENT S
GROUP BY s.BDAY
HAVING COUNT(s.NAME)>1
)
ORDER by s.BDAY;



SELECT  s.NAME, s.BDAY
from STUDENT S
    INNER JOIN STUDENT SS
    on s.BDAY = ss.BDAY
        and s.NAME != ss.NAME






