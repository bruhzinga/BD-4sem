use UNIVER;
DECLARE @z FLOAT, @t FLOAT, @x FLOAT
SET @z = 1
SET @t = 5
SET @x = 3
IF @t > @x
	SET @z = CONVERT(INT, SIN(@t))^2
ELSE IF @t < @x
	SET @z = 4*(@t + @x)
ELSE
	SET @t = 1 - EXP(@x - 2)
PRINT 'Answer ' + cast(@z as varchar)