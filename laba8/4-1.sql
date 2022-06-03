--  преобразование полного ФИО сту-дента в сокращенное (например, Макей-чик Татьяна Леонидовна в Макейчик Т. Л.);
--
use UNIVER;
SELECT substring(STUDENT.NAME, 1, charindex(' ', STUDENT.NAME))
+substring(STUDENT.NAME, charindex(' ', STUDENT.NAME)+1,1)+'.'
+substring(STUDENT.NAME, charindex(' ', STUDENT.NAME, charindex(' ', STUDENT.NAME)+1)+1,1)+'.' AS [STUDENT NAME]
FROM STUDENT;






