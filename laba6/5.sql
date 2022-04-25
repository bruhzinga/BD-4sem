use UNIVER;
select G.PROFESSION[Специальность], F.FACULTY,P.SUBJECT ,round(AVG(CAST(P.NOTE as float(4))), 2) [Средний]
From FACULTY F
         inner join GROUPS G on F.FACULTY = G.FACULTY
         inner join STUDENT S on G.IDGROUP = S.IDGROUP
         inner join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
where F.FACULTY = 'ТОВ'
GROUP BY rollup (F.FACULTY, G.PROFESSION, P.SUBJECT);







