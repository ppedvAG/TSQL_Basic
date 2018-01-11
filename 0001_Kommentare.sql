use master; --Verbindung mit DB
GO
--leiten einen Kommentar ein... ab den -- bis zum Ende der Zeile


/*
Kommentar geht über mehr 
Zeilen
select getdate()
*/

--immer zuerst das markieren, was man ausführen möchte


drop database testdb; -- wird rigoros gelöscht!
GO


--ein guter SQL Code besitzt immer
--notwendige Kommenatere
--formatierten Code
--am Ende ein ;
--und ein GO am Ende
use northwind;
GO

select --Kommentar
		* --Kommentar
from  --Kommentar
customers --Kommentar
where 
customerid = 'ALFKI';--Kommentar
GO
















