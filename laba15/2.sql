use UNIVER

--Task 2 (создание XML-документа в режиме AUTO)

select AUDITORIUM.AUDITORIUM [Аудитория], AUDITORIUM.AUDITORIUM_TYPE [Наимменование_типа], AUDITORIUM.AUDITORIUM_CAPACITY [Вместимость]
from AUDITORIUM join AUDITORIUM_TYPE on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = 'ЛК' for xml auto , root('Список_аудиторий');