use UNIVER
go
create view [Расписание]
    as select top(50) [day], [lesson], [1 group], [2 group], [3 group], [4 group]
    from (
         select top(50) DAY_NAME [day],
                        LESSON [lesson],
                        convert(varchar, IDGROUP) + ' group' [group],
                        SUBJECT[discipline]
         from TIMETABLE
             ) tb1
    pivot (
        max([discipline])
        for [group]
        in ([1 group], [2 group], [3 group], [4 group])
        ) as pvt
    order by (
        case
            when [day] like N'пн' then 1
            when [day] like N'вт' then 2
            when [day] like N'ср' then 3
        end), [lesson]

use UNIVER;
select * from [Расписание]