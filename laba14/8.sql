use UNIVER
go
	create trigger F_INSTEAD_OF
	on FACULTY instead of DELETE
	as
	    begin
raiserror(N'Удаление запрещено', 10, 1);

end;
	return;

 delete FACULTY where FACULTY = 'NEW';

drop TRIGGER F_INSTEAD_OF,PTran,TEACH_AFTER_DEL1,TEACH_AFTER_DEL2,TEACH_AFTER_DEL3,TR_TEACHER