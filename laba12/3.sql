use UNIVER;
--3:
-- временная локальная таблица, изменить процедуру, insert

-- изменения в процедуру с помощью ALTER:
ALTER procedure PSUBJECT @p varchar(20)
as begin
	SELECT * from SUBJECT where SUBJECT = @p;
end;
--drop procedure PSUBJECT;

-- создание временной таблицы:
CREATE table #SUBJECTs
(
	Код_предмета varchar(20),
	Название_предмета varchar(100),
	Кафедра varchar(20)
);
--drop table #SUBJECTs;

-- INSERT добавляет строки во временную таблицу:
INSERT #SUBJECTs EXEC PSUBJECT 'ИСиТ';
INSERT #SUBJECTs EXEC PSUBJECT 'ПОиБМС';

-- Просмотреть содержимое временной таблицы:
SELECT * from #SUBJECTs;
go