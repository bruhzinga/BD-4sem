create table TIMETABLE
(
    DAY_NAME char(2) check (DAY_NAME in('пн', 'вт', 'ср', 'чт', 'пт', 'сб')),
    LESSON integer check(LESSON between 1 and 4),
    TEACHER char(10) constraint TIMETABLE_TEACHER_FK  foreign key references TEACHER(TEACHER),
    AUDITORIUM char(20) constraint TIMETABLE_AUDITORIUM_FK foreign key references AUDITORIUM(AUDITORIUM),
    SUBJECT char(10) constraint TIMETABLE_SUBJECT_FK  foreign key references SUBJECT(SUBJECT),
    IDGROUP integer constraint TIMETABLE_GROUP_FK  foreign key references GROUPS(IDGROUP),
)

insert into TIMETABLE
values
    ('пн', 1, 'СМЛВ', '313-1', 'СУБД', 2),
    ('пн', 2, 'СМЛВ', '313-1', 'ОАиП', 4),
    ('пн', 3, 'СМЛВ', '313-1', 'ОАиП', 11),

    ('пн', 1, 'МРЗ', '324-1', 'СУБД', 6),
    ('пн', 3, 'МРЗ', '324-1', 'ПИС', 4),

    ('пн', 2, 'БРКВЧ', '413-1', 'СУБД', 8),

    ('пн', 2, 'ДТК', '423-1', 'СУБД', 7),
    ('пн', 4, 'ДТК', '423-1', 'ОАиП', 2),

    ('вт', 1, 'СМЛВ', '313-1', 'СУБД', 2),
    ('вт', 2, 'СМЛВ', '313-1', 'ОАиП', 4),

    ('вт', 3, 'УРБ', '324-1', 'ПИС', 4),
    ('вт', 4, 'СМЛВ', '206-1', 'ОАиП', 3)