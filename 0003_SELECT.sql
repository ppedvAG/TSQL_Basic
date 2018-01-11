--SELECT

/*
SELECT -- Ausgabe der Daten bzw Ergebnis von F()
	  Spalten, Mathe, Text, ....
FROM 
	TABELLE

* steht für alle Spalten der Tabellen aus dem FROM

*/

use northwind;
GO

select * from customers; --alle Kunden

select customerid, companyname from customers;


--Spalten ohne Bezeichnung.. ALIAS
select	left(country, 2) 
		, country
		, customerid
		, 2 as Zahlendemo
		, 2*3 as Mathedemo
		, 'TEXT' as TextDemo 
from customers;


Select * from orders

--Liste aller Bestellungen mit Ausgabe von BestNr, Jahr des Bestelldatums), Monat als Name, Frachtkosten

select	  orderid 
		, year(orderdate) as Jahr
		, datename(mm,orderdate) as Monat
		, freight as Frachtkosten
from
	orders;
GO


select getdate()
GO 3

--GO ist ein Batchdelimiter

select * from orders
GO
select * from customers
GO
select GETDATE()
GO


declare @i as int = 10
select @i
select @i
GO --- das @i ist nun nicht mehr gültig
select @i


