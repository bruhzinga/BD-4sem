use UNIVER
go
    create  trigger TR_TEACHER_UPD
      on TEACHER after UPDATE
      as
      declare @a1 char(10), @a2 varchar(100), @a3 char(1), @a4 char(20), @in varchar(300);
	  declare @ins int = (select count(*) from inserted)
      print 'Обновление';
      set @a1 = (select TEACHER from INSERTED);
      set @a2= (select TEACHER_NAME from INSERTED);
      set @a3= (select GENDER from INSERTED);
	  set @a4 = (select PULPIT from INSERTED);
      set @in = @a1+' '+ @a2 +' '+ @a3+ ' ' +@a4;
      insert into TR_AUDIT(STMT, TRNAME, CC)
                            values('UPD', 'TR_TEACHER_UPD', @in);
      return;
      go

	  update TEACHER set GENDER = 'ж' where TEACHER='Кирд'
	  select * from TR_AUDIT

	  delete from TR_AUDIT where STMT = 'UPD'
