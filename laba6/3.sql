use UNIVER;
select *
	FROM(SELECT CASE 
		WHEN NOTE = 10 then '10'
		WHEN NOTE between 8 and 9 then '8-9'
		WHEN NOTE between 6 and 7 then '6-7'
		WHEN NOTE between 4 and 5 then '4-5'
	END [Диапазон],
	COUNT(*) as [Кол-во]
	FROM PROGRESS GROUP BY CASE
		WHEN NOTE = 10 then '10'
		WHEN NOTE between 8 and 9 then '8-9'
		WHEN NOTE between 6 and 7 then '6-7'
		WHEN NOTE between 4 and 5 then '4-5'
	END) AS T
ORDER BY Case [Диапазон]
	WHEN '10' then 4
	WHEN '8-9' then 3
	WHEN '6-7' then 2
	WHEN '4-5' then 1
	ELSE 0
	END;
