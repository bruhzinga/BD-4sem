use UNIVER;
SELECT distinct PULPIT.PULPIT_NAME as 'Кафедра', FACULTY_NAME as 'Факультет'
FROM PULPIT
    inner join PROFESSION
    on  (PROFESSION.PROFESSION_NAME like '%технологии%' or PROFESSION.PROFESSION_NAME like '%технология%')
    inner join FACULTY
    on PROFESSION.FACULTY = FACULTY.FACULTY and PROFESSION.FACULTY = PULPIT.FACULTY 