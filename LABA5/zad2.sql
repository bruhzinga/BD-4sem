use UNIVER;
SELECT PULPIT.PULPIT_NAME as 'Кафедра', FACULTY_NAME as 'Факультет'
from PULPIT inner join FACULTY
    on PULPIT.FACULTY = FACULTY.FACULTY
        and
        PULPIT.FACULTY In (SELECT PROFESSION.FACULTY
        FROM PROFESSION
        WHERE PROFESSION_NAME like '%технологии%' or PROFESSION_NAME like '%технология%' )