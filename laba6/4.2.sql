
use UNIVER;
Select F.FACULTY [Факультет],G.PROFESSION [Специальность],2014-G.YEAR_FIRST [КУРС] , round(AVG(CAST(P.NOTE as float(4))),2) [Средний]
From FACULTY F
         inner join GROUPS G on F.FACULTY = G.FACULTY
         inner join STUDENT S on G.IDGROUP = S.IDGROUP
         inner join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
where P.SUBJECT IN('БД','ОАиП')
group by G.YEAR_FIRST , G.PROFESSION, F.FACULTY
order by [Средний] desc;

