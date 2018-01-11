--UPDATE

select top 3  * from kunden

update kunden set city = 'Aachen' 
	   where customerid = 'ALFKI'


update kunden set	city = 'London' ,
					country = 'UK'
	   where customerid = 'ANTON'

--Tabelle zum Spielen
select * into orders2 from orders

--Wir wollen die Frachtkosten überall um 10% erhöhen

update orders2 set freight = freight*1.1
--alle Zeilen wurden um 10% erhöht


---wir wollen alle Frachtkosten um 10% senken, bei denen die Bestellungen 
--von Kunden aus UK stammen


--Tipp:
--schreibe zuerst den Select um herauszufinde, 
--welche Bestellung bzw Kunden betroffen sind


select c.customerid, o.orderid, o.freight, c.country from orders2 o
inner join customers c on o.customerid = c.customerid
where c.country = 'UK'


--so formatieren
--From in eigene Zeile
--formulieren den update
--dann kommentiere den SELECT aus... fertig
update orders2 set freight = freight / 1.1
--select c.customerid, o.orderid, o.freight, c.country 
from orders2 o
inner join customers c on o.customerid = c.customerid
where c.country = 'UK'

--Tipp: bist du dir dennoch unsicher, dann verwende Transaktionen

begin tran --transaction
--Anweisungen

commit-- Fertig
rollback--rückgängig



begin tran --transaction
select * from orders2
update orders2 set freight = 100
where orderid = 10248

--commit-- Fertig
rollback--rückgängig




