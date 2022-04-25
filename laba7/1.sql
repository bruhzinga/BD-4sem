use UNIVER;
go
Create VIEW [Преподователь] as
    select T.TEACHER[КОД], T.TEACHER[ФИО],T.GENDER[Пол],T.PULPIT[Код кафедры]
from TEACHER T;

select *
from [Преподователь]