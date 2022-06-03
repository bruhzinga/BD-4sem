use UNIVER;
select SS.SUBJECT[Предмет], count(IDSTUDENT)[Количестов Оценок]
From    (
     select P.SUBJECT,P.IDSTUDENT,P.NOTE from PROGRESS P
	  where  NOTE in(8,9)
    
        ) as S
right join
        (
         select distinct SUBJECT from PROGRESS
        ) as SS on S.SUBJECT=SS.SUBJECT
group by SS.SUBJECT
order by count(IDSTUDENT) desc;




