use ZDA_MyBase;
create table Группа
(
    Номер_группы tinyint constraint GRUPPA_PRIMARY_KEY primary key,
    Специальность nvarchar(20) not null,
    Отделение nvarchar(20) not null,
    Количество_студентов int not null,
) on FG1;
create table Преподователи
(
    Код_Преподователя smallint constraint PREPODOVATELY_PRIMARY_KEY primary key,
    Фамилия_Преподователя nvarchar(20),
    Имя nvarchar(20),
    Отчество nvarchar(20),
    Телефон int,
    Стаж nvarchar(20),
) on FG1;
create table Расценки
(
    Количество_часов int,
    Предмет nvarchar(20),
    Тип_занятия nvarchar(20),
    Оплата money,
    Код_Преподователя smallint foreign key references Преподователи(Код_Преподователя),
    Номер_группы tinyint foreign key references Группа(Номер_группы),
);
select * from Преподователи;