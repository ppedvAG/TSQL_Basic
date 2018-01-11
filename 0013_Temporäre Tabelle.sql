--Tempor�re Tabelle

create table Tabname --noch keine Daten
	(
	Sp1 int,
	sp2 varchar(50),
	Sp3 date,
	...
	)

--alter , drop 

select * into neutab from tab --Abfragergebnis wird in eine neue Tabelle umgeleitet


--2 Sorten von temp. Tabelle
--# 
--##
--##tab oder #tab

--# lokale tempor�re Tabelle
--existiert nur in der Verbindung, in der sie erstellt wurde
--sobald die Verbindung geschlossen wird ist die temp. Tabelle weg
--oder Ersteller hat drop table #test ausgef�hrt

create table #test (id int)

select * from #test

create table ##test (id int)

--## globale temp. Tabelle.. ist in jeder Verbindung zu finden
--exisistiert bis der Ersteller sie l�scht oder Verbindung beendet
--allerdings werden die ##tab in anderern Verbindungen erst gel�scht, wenn sie in keiner aktuelle
--laufenden Abfrage verwendet werden



--Wof�r? 

--temp. besitzten Daten!!

--Alfki kleinste gr��te Rechnung

SELECT TOP 1 customerid, o.orderid, sum(unitprice*quantity)  as RngSumme 
into #t1
FROM orders o
	INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
	WHERE customerid = (SELECT customerid FROM customers WHERE customerid LIKE 'ALF%')
	GROUP BY customerid, o.orderid
	ORDER BY 1,3 ASC

SELECT TOP 1 customerid, o.orderid, sum(unitprice*quantity)  as RngSumme 
into #t2
FROM orders o
	INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
	WHERE customerid = (SELECT customerid FROM customers WHERE customerid LIKE 'ALF%')
	GROUP BY customerid, o.orderid
	ORDER BY 1,3 desc


select * from #t1
UNION ALL
Select * from #t2

--Alternative

SELECT TOP 1 customerid, o.orderid, sum(unitprice*quantity)  as RngSumme 
into #txy
FROM orders o
	INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
	WHERE customerid = (SELECT customerid FROM customers WHERE customerid LIKE 'ALF%')
	GROUP BY customerid, o.orderid
	ORDER BY 1,3 ASC

----temp. Tabelle f�r Kunden aus UK
---temp . Tabelle f�r Kunden aus London


select * into #tUK from customers where country = 'UK'

select * into #tLondon from  customers where city = 'london'

--haben sich die Daten mittlerweile ver�ndert

select * from #tUK
intersect--gemeinsame Zeilen
select * from #tLondon

select * from #tLondon
intersect --gemeinsame Zeilen
select * from #tUK


update #tUK set city = 'Oxford' where customerid = 'AROUT'


--und die unterschiedlichen
select * from #tUK --Basis
except--unterschiedl. Zeilen
select * from #tLondon

select * from #tLondon --Basis
except--unterschiedl. Zeilen
select * from #tUK



insert into #txy
SELECT TOP 1 customerid, o.orderid, sum(unitprice*quantity)  as RngSumme 
FROM orders o
	INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
	WHERE customerid = (SELECT customerid FROM customers WHERE customerid LIKE 'ALF%')
	GROUP BY customerid, o.orderid
	ORDER BY 1,3 DESC

	select * from #txy