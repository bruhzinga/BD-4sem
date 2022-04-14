use UNIVER;
select MAX(AUDITORIUM_CAPACITY) [Максимальная вместимость аудитории],
       min(AUDITORIUM_CAPACITY) [Минимальная вместимость аудитории],
       avg(AUDITORIUM_CAPACITY) [Средняя вместимость аудитории],
       sum(AUDITORIUM_CAPACITY) [Общая вместимость аудитории],
       count(AUDITORIUM) [Количество аудиторий]
from AUDITORIUM