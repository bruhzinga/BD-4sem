use UNIVER;
select top(1)
    (select avg(P.NOTE)
    from PROGRESS P
    WHERE P.SUBJECT='ОАиП' ) [ОАИП] ,
    (select avg(P.NOTE)
    from PROGRESS P
    WHERE P.SUBJECT='БД' ) [БД],
    (select avg(P.NOTE)
    from PROGRESS P
    WHERE P.SUBJECT='СУБД' ) [СУБД]
