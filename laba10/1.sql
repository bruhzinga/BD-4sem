use UNIVER;

declare @subj_list char(50), @subj_name char(100)='';
declare discipline cursor for select SUBJECT from SUBJECT where SUBJECT.PULPIT='ИСиТ';

open discipline;
fetch discipline into @subj_list;       -- считывает строку из рез. набора и продвигает указатель на след. строку.
print 'Дисциплины на кафедре ИСиТ: ';
while @@fetch_status=0                  ---- считывание вып. успешно (1 если конец набора, 2 если строки не существует)
begin
   set @subj_name=rtrim(@subj_list)+', '+@subj_name;    -- добавляет к переменной значение из строки из рез. набора
   fetch discipline into @subj_list;
end;
    print @subj_name;
close discipline;