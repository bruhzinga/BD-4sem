use UNIVER;
BEGIN TRY
UPDATE dbo.AUDITORIUM SET AUDITORIUM_CAPACITY = 'А'
    where AUDITORIUM_TYPE ='Лк'
END TRY
BEGIN CATCH
PRINT ERROR_NUMBER()
PRINT ERROR_MESSAGE()
PRINT ERROR_LINE()
PRINT ERROR_PROCEDURE()
PRINT ERROR_SEVERITY()
PRINT ERROR_STATE()
END CATCH