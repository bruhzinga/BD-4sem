use UNIVER
go
alter VIEW [Количество кафедр] with schemabinding as
select F.FACULTY_NAME[факультет], COUNT(P.FACULTY) [количество кафедр]
from dbo.FACULTY F inner join dbo.PULPIT P on F.FACULTY = P.FACULTY
group by F.FACULTY_NAME
