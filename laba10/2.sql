use UNIVER;
-- отличие глобального курсора от локального:

-- локальный курсор:
declare Puls cursor LOCAL for select PULPIT, FACULTY from PULPIT;

declare @pul nvarchar(10), @fac nvarchar(4);
open Puls;
	fetch Puls into @pul, @fac;
    print rtrim(@pul)+' на факультете >  '+ @fac;

-- пример использования глобального курсора:
declare Puls cursor GLOBAL for select PULPIT, FACULTY from PULPIT;
declare @pul1 nvarchar(10), @fac1 nvarchar(4);
open Puls;
    fetch Puls into @pul1, @fac1;
    print rtrim(@pul1)+' на факультете > '+ @fac1;

	declare @pul2 nvarchar(10), @fac2 nvarchar(4);
	fetch  Puls into @pul2, @fac2;
    print rtrim(@pul2)+' на факультете > '+ @fac2;

    declare @pul3 nvarchar(10), @fac3 nvarchar(4);
    fetch  Puls into @pul3, @fac3;
    print rtrim(@pul3)+' на факультете > '+ @fac3;

    declare @pul4 nvarchar(10), @fac4 nvarchar(4);
    fetch  Puls into @pul4, @fac4;
    print rtrim(@pul4)+' на факультете > '+ @fac4;
close Puls;
deallocate Puls;        -- освобождает память от курсора