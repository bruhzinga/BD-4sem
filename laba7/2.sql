use UNIVER;
Go
create VIEW [Количество кафедр] AS
select F.FACULTY_NAME[факультет], COUNT(P.FACULTY) [количество кафедр]
from FACULTY F inner join PULPIT P on F.FACULTY = P.FACULTY
group by F.FACULTY_NAME

select *
from [Количество кафедр];