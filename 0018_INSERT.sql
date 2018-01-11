--INSERT

--Tabelle und wollen neue Zeilen einfügen

--select * from kunden


insert into kunden (customerid, companyname, city, country)
VALUES
					('EURIM', 'EURIM Holding', 'Pieding', 'Bayern')

--wenn alle Spalten übergeben werden
--und in der exakten Reihenfolge der Tabelle übergeben werden
insert into kunden 
VALUES
			('EURI2', 'EURIM AG', NULL,NULL,NULL,'Piding',NULL,NULL, 'Bayern', NULL,NULL)


--Zeilen aus Tabellen in andere Tabellen kopieren


insert into customers
select * from kunden where customerid = 'Euri2'


insert into customers (Customerid, companyname)
select Customerid, companyname from kunden where customerid = 'Eurim'

-- Zeilen in nicht bestehende Tabellen einfügen..

SELECT ..INTO.. FROM
--Datentypen werden übernommen, auch Identity
--bei manueleln Werten schätzt SQL Server sehr genau



Select * into Kunden from customers

Select 'A' as SPA, 'B' as SPB into TEST1
select * from test1

select 'A' as SPX INTO TEST2
UNION
SELECT'B'
UNION
SELECT'C'

select * from test2
