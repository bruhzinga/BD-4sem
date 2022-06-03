-- объявить переменные типа char, varchar, datetime, time, int, smallint, tinint, numeric(12, 5);
declare @var1 char(10)='Первая переменная';
declare @var2 varchar(10)='Вторая переменная';
declare @var3 datetime;
declare @var4 time;
declare @var5 int;
declare @var6 smallint;
declare @var7 tinyint;
declare @var8 numeric(12, 5);

-- первые две переменные проинициализи-ровать в операторе объявления;

-- присвоить произвольные значения сле-дующим двум переменным с помощью оператора SET, одной из этих перемен-ных присвоить значение, полученное в результате запроса SELECT;
set @var3 = getdate();
select @var4 = getdate();

--  одну из переменных оставить без инициализации и не присваивать ей зна-чения, оставшимся переменным присво-ить некоторые значения с помощью оператора SELECT;
select @var5 = 123456789;
select @var6 = 123;
select @var7 = 12;



-- значения одной половины переменных вывести с помощью оператора SELECT, значения другой половины переменных распечатать с помощью оператора PRINT.
select @var1, @var2, @var3, @var4;
print cast(@var5 as varchar(10)) + ' ' + cast(@var6 as varchar(10)) + ' ' + cast(@var7 as varchar(10));


