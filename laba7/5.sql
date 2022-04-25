use UNIVER
go
create VIEW [Дисциплины] AS
    select top(100) S.SUBJECT[код],S.SUBJECT_NAME[наименование дисциплины],S.PULPIT[код кафедры]
from SUBJECT S
order by S.SUBJECT_NAME