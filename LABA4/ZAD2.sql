use UNIVER;
SELECT AUDITORIUM, AUDITORIUM_TYPENAME
FROM AUDITORIUM INNER JOIN AUDITORIUM_TYPE
    On AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
        And AUDITORIUM_TYPE.AUDITORIUM_TYPENAME  like '%компьютер%'

