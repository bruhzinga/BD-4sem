use UNIVER;
--− является коммутативной операцией;
select PULPIT.PULPIT_NAME as 'Кафедра', isnull(TEACHER.TEACHER_NAME, '***') as 'Преподаватель'
from PULPIT full outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT
ORDER BY PULPIT.PULPIT_NAME
select PULPIT.PULPIT_NAME as 'Кафедра', isnull(TEACHER.TEACHER_NAME, '***') as 'Преподаватель'
from TEACHER full outer join PULPIT on PULPIT.PULPIT = TEACHER.PULPIT
ORDER BY PULPIT.PULPIT_NAME;
-- включает соединение INNER JOIN этих таблиц.
select PULPIT.PULPIT_NAME as 'Кафедра', isnull(TEACHER.TEACHER_NAME, '***') as 'Преподаватель'
from PULPIT inner join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT;
--запрос, результат которого содержит данные левой (в операции FULL OUTER JOIN) таб-лицы и не содержит данные правой; 
select isnull(PULPIT.PULPIT_NAME, '***') as 'Кафедра', isnull(TEACHER.TEACHER_NAME, '***') as 'Преподаватель'
from PULPIT full outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT
where PULPIT.PULPIT_NAME is null and TEACHER.TEACHER_NAME is not null;
--запрос, результат которого содержит данные правой таблицы и не содержащие данные ле-вой; 
select isnull(PULPIT.PULPIT_NAME, '***') as 'Кафедра', isnull(TEACHER.TEACHER_NAME, '***') as 'Преподаватель'
from PULPIT full outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT
where PULPIT.PULPIT_NAME is not null and TEACHER.TEACHER_NAME is null;
--запрос, результат которого содержит данные правой таблицы и левой таблиц;
select isnull(PULPIT.PULPIT_NAME, '***') as 'Кафедра', isnull(TEACHER.TEACHER_NAME, '***') as 'Преподаватель'
from PULPIT full outer join TEACHER on PULPIT.PULPIT = TEACHER.PULPIT
where PULPIT.PULPIT_NAME is not null and TEACHER.TEACHER_NAME is not null;



   


