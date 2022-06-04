use UNIVER;
--Task 1 (создание XML-документа в режиме PATH)

select *    from TEACHER inner join PULPIT
                on TEACHER.PULPIT = PULPIT.PULPIT
            where TEACHER.PULPIT = 'ИСиТ' for xml path, root('Список_преподавателей_кафедры_ИСиТ');