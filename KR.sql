create DATABASE KR;
go
USE KR;
create TABLE MU_GROUP
    (
        IDGR int PRIMARY KEY ,
        FACLT nvarchar(50) NOT NULL ,
        PROF NVARCHAR(50) NOT NULL CHECK (PROF IN ( 'ИСИТ', 'ПОИТ')),
        YEARP SMALLINT  NOT NULL default 2022,




    );
create TABLE STUD
    (
        IDST int PRIMARY KEY IDENTITY (1,1),
        IDGR int foreign key references [MU_GROUP](IDGR),
        NAME nvarchar(50) NOT NULL ,
        BDAY Datetime  NOT NULL,


);
insert INTO MU_GROUP (IDGR, FACLT, PROF, YEARP) VALUES (1, 'ФИТ', 'ИСИТ', 2020),(2, 'ФИТ', 'ПОИТ', 2020),(3, 'ФИТ', 'ИСИТ', 2021),(4, 'ФИТ', 'ПОИТ', 2021);
insert into STUD ( NAME, BDAY,IDGR) VALUES ( 'Иванов Иван Иванович', '01.01.2000',1),('Петров Петр Петрович', '01.01.2000',1),( 'Сидоров Сидр Сидорович', '01.01.2000',2);

select FACLT[Факультет], PROF[Специалность], YEARP[Дата поступления], MU_GROUP.IDGR[Группа], NAME[Имя Студента], 2022-YEARP[Курс]
From MU_GROUP inner join STUD S on MU_GROUP.IDGR = S.IDGR

select FACLT[Факультет], PROF[Специалность],  MU_GROUP.IDGR[Группа], NAME[Имя Студента], BDAY[Дата рождения]
from MU_GROUP inner join STUD S on MU_GROUP.IDGR = S.IDGR
where BDAY between '01.01.2000' and '01.01.2001'
