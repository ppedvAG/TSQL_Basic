--DELETE
--Zeilen löschen

delete from tabelle where sp = wert

select * from kunden

delete from kunden where customerid = 'ALFKI'

--Lösche alle Kunden, deren frachtkosten unter 0.1 lagen

delete from  kunden  --delete kan auch ohne from geschrieben werden
--select *
from kunden k inner join orders2 o on o.customerid = k.customerid
where o.freight < 0.1


select * from orders2

--Lösche die Frachtkosten von 10248

--kein delete !!

update orders2 set freight = NULL where orderid = 10248


