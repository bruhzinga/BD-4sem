use master
CREATE DATABASE [JABA]
use JABA;

create TABLE [People]
(
    [ФИО] NVARCHAR(20) PRIMARY KEY,
    [Дата Рождения] DATE,
)
go
CREATE TABLE [Letters]
(
    [Отправитель] NVARCHAR(20) FOREIGN KEY REFERENCES People(ФИО),
    [Получатель] NVARCHAR(20) FOREIGN KEY REFERENCES People(ФИО),
    [Тема Письма] NVARCHAR(20),
    [Текст Письма] NVARCHAR(100),
    [Дата Отправки] DATE
)
;
insert into  People
VALUES
    ('Зворыкин Дмитрий', '2003-05-17'),
    ('Тимофей Хованский', '2003-10-10'),
    ('Наташа Стальмахова', '2002-8-8'),
    ('Илона Маск', '1980-6-7');


insert into Letters
VALUES('Зворыкин Дмитрий', 'Илона Маск', 'Tesla', 'Дай Теслу', '2022-03-21'),
    ('Тимофей Хованский', 'Зворыкин Дмитрий', 'jetbrains', 'jetbrains лучше', '2022-01-01'),
    ('Илона Маск', 'Зворыкин Дмитрий', 'Tesla', 'NET', '2022-04-21'),
    ('Зворыкин Дмитрий', 'Илона Маск', 'Tesla', ':(', '2022-05-21');

select top(1)
    [Отправитель]
from Letters
ORDER by len([Текст Письма]);


select distinct [ФИО], [Дата Рождения],
    count(ФИО) OVER (PARTITION by ФИО) AS [КОЛ-ВО ПИСЕМ]
from People join Letters
    ON People.ФИО = Letters.Отправитель;

select distinct [ФИО], [Дата Рождения]
from People join Letters
    ON People.ФИО = Letters.Отправитель
WHERE Letters.[Тема Письма]='Tesla';

select distinct [ФИО], [Дата Рождения],[Тема Письма]
from People join Letters
    ON People.ФИО = Letters.Отправитель
WHERE  NOT Letters.[Тема Письма]='Tesla';

SELECT [ФИО] from People;



