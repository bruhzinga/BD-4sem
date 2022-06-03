use UNIVER;

-- #4:
-- сценарий, демонстрирующий свойства навигации в результирующем наборе курсора с атрибутом SCROLL:

declare @num int, @rn char(50);
declare Primer4 cursor local dynamic SCROLL for select row_number() over (order by NAME) N, NAME from STUDENT where NAME like 'К%'
open Primer4;
fetch FIRST from Primer4 into @num, @rn;
print 'Первая строка: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch NEXT from Primer4 into @num, @rn;
print 'Следующая строка за текущей: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch PRIOR from Primer4 into @num, @rn;
print 'Предыдущая строка от текущей: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch ABSOLUTE 3 from Primer4 into @num, @rn;
print 'Третья строка от начала: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch ABSOLUTE -3 from Primer4 into @num, @rn;
print 'Третья строка от конца: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch RELATIVE 2 from Primer4 into @num, @rn;
print 'Вторая строка вперед от текущей: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch RELATIVE -2 from Primer4 into @num, @rn;
print 'Вторая строка назад от текущей: '+cast(@num as varchar(3))+') '+rtrim(@rn);
fetch LAST from Primer4 into @num, @rn;
print 'Последняя строка: '+cast(@num as varchar(3))+') '+rtrim(@rn);
close Primer4;