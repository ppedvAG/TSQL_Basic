Create table tabellenname
	(
	Spalte datentyp,
	Spalte datentyp,
	...
	)

create table testtab
	(	
	 id int,
	 sp1 int,
	 sp2 varchar(20)
	 )

create table testtab2
	(	
	 id int identity , --Hochzähler
	 sp1 int,
	 sp2 varchar(20)
	 )




--Ändern einer Tabelle

alter table testtab
add spx int

alter table testtab
drop column spx


drop table testtab --Löschen einer Tabelle