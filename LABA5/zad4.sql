--На основе таблицы AUDITORIUM сфор-мировать список аудиторий самых боль-ших вместимостей
--(столбец AUDITORI-UM_CAPACITY) для каждого типа ауди-тории (AUDITORIUM_TYPE).
--При этом результат следует отсортировать в поряд-ке убывания вместимости. 
--Примечание: использовать коррелируемый подзапрос c секциями TOP и ORDER BY. 
use UNIVER;
SELECT a.AUDITORIUM_TYPE, a.AUDITORIUM_CAPACITY
From AUDITORIUM a
WHERE a.AUDITORIUM_CAPACITY = (
    select top(1)
    aa.AUDITORIUM_CAPACITY
from AUDITORIUM aa
WHERE aa.AUDITORIUM_TYPE=a.AUDITORIUM_TYPE
ORDER BY aa.AUDITORIUM_CAPACITY desc
)
ORDER by a.AUDITORIUM_CAPACITY desc
