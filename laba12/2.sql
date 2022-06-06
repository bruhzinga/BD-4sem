use UNIVER;
--2:
-- изменить + параметры
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[PSUBJECT] @p varchar(20), @c int output
as
begin
declare @k int=(select COUNT(*) from SUBJECT);
print 'Параметры: @p='+@p+', @c='+cast(@c as varchar(3));
select SUBJECT [КОД], SUBJECT_NAME [ДИСЦИПЛИНА], PULPIT [КАФЕДРА] from SUBJECT where PULPIT = @p;
set @c=@@ROWCOUNT;
return @k;
end;

drop procedure PSUBJECT;

declare @temp_2 int = 0, @out_2 int = 0;
exec @temp_2 = PSUBJECT 'ИСиТ', @out_2 output;
print 'Дисциплин всего: ' + convert(varchar, @temp_2);
print 'Дисциплин на кафедре ИСиТ: ' + convert(varchar, @out_2);
go