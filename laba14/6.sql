use UNIVER
go
create trigger TEACH_AFTER_DEL1 on TEACHER after DELETE
as print '1';
 return;
go
create trigger TEACH_AFTER_DEL2 on TEACHER after DELETE
as print '2';
 return;
go
create trigger TEACH_AFTER_DEL3 on TEACHER after DELETE
as print '3';
 return;
go

delete TEACHER where TEACHER='ИВНВ'


select t.name, e.type_desc
  from sys.triggers  t join  sys.trigger_events e  on t.object_id = e.object_id
  where OBJECT_NAME(t.parent_id)='TEACHER' and e.type_desc = 'DELETE' ;

exec  SP_SETTRIGGERORDER @triggername = 'TEACH_AFTER_DEL3',
	                        @order='First', @stmttype = 'DELETE';
exec  SP_SETTRIGGERORDER @triggername = 'TEACH_AFTER_DEL2',
	                        @order='Last', @stmttype = 'DELETE';
