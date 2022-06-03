use UNIVER;
select T.AUDITORIUM_TYPENAME [ТИП],
        MAX(A.AUDITORIUM_CAPACITY) [Максимальная вместимость аудитории],
       min(A.AUDITORIUM_CAPACITY) [Минимальная вместимость аудитории],
       avg(A.AUDITORIUM_CAPACITY) [Средняя вместимость аудитории],
       sum(A.AUDITORIUM_CAPACITY) [Общая вместимость аудитории],
       count(A.AUDITORIUM) [Количество аудиторий]
From AUDITORIUM A inner join AUDITORIUM_TYPE T on T.AUDITORIUM_TYPE = A.AUDITORIUM_TYPE
group by T.AUDITORIUM_TYPENAME
