/*Подсчитать количество студентов в каждой группе, на каждом факультете и всего в университете одним запросом. */
use UNIVER;
Select  G.IDGROUP, G.FACULTY,count(S.IDSTUDENT)[Количество студентов]
FROM GROUPS G inner join STUDENT S on G.IDGROUP = S.IDGROUP
GROUP BY Cube (G.IDGROUP, G.FACULTY)
-- Подсчи-тать количество аудиторий по типам и суммарной вместимости в корпусах и всего одним запрос*/
use UNIVER;
select AUDITORIUM_TYPE.AUDITORIUM_TYPE , count(AUDITORIUM)  [Кол-во аудиторий],sum(AUDITORIUM_CAPACITY)  [Суммарная вместимость]
from AUDITORIUM_TYPE full join AUDITORIUM A on AUDITORIUM_TYPE.AUDITORIUM_TYPE = A.AUDITORIUM_TYPE
group by rollup (AUDITORIUM_TYPE.AUDITORIUM_TYPE)