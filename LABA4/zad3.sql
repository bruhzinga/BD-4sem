use UNIVER;
SELECT A1.AUDITORIUM, A2.AUDITORIUM_TYPENAME
FROM AUDITORIUM as A1, AUDITORIUM_TYPE as A2
WHERE A1.AUDITORIUM_TYPE = A2.AUDITORIUM_TYPE;
GO
SELECT A1.AUDITORIUM, A2.AUDITORIUM_TYPENAME
FROM AUDITORIUM as A1, AUDITORIUM_TYPE as A2
WHERE A1.AUDITORIUM_TYPE = A2.AUDITORIUM_TYPE
    AND A2.AUDITORIUM_TYPENAME  like '%компьютер%'

