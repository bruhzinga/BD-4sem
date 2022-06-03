use UNIVER;

CREATE TABLE #TASK(
	ID INT,
	Name VARCHAR(20),
	Message VARCHAR(MAX)
	)
GO

DECLARE @index INT = 0
WHILE @index < 10
	BEGIN
	INSERT #TASK VALUES (@index, 'name' + CAST(@index as varchar), 'message' + CAST(@index AS varchar))
	SET @index += 1
	END
SELECT * FROM #TASK