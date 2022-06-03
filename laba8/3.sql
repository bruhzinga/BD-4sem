use UNIVER;
PRINT CAST(@@ROWCOUNT AS VARCHAR) + ' число обрабо-танных строк; '
PRINT CAST(@@VERSION AS VARCHAR) + ' версия SQL Server; '
PRINT CAST(@@SPID AS VARCHAR) + ' возвращает системный идентификатор процесса, назначен-ный сервером текущему подключе-нию;'
PRINT CAST(@@ERROR AS VARCHAR) + ' код последней ошибки; '
PRINT CAST(@@SERVERNAME AS VARCHAR) + ' имя сервера; '
PRINT CAST(@@TRANCOUNT AS VARCHAR) + ' возвращает уровень вложенности транзакции; '
PRINT CAST(@@FETCH_STATUS AS VARCHAR) + ' проверка ре-зультата считывания строк результи-рующего набора; '
PRINT CAST(@@NESTLEVEL AS VARCHAR) + ' уровень вложен-ности текущей процедуры.';