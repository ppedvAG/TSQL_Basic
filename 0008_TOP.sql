--TOP
--die ersten 10 Kunden..
SELECT TOP 10 * FROM Customers 

--wieso genau die??..wg der physikalischen Speicherung..

--eigtl steht ein TOP immer in Verbindung mit einem order by 
--die 10 TOP Bestellungen nach Frachtkosten
SELECT top 10 orderid, freight FROM orders ORDER BY freight ASC


--auch mit Prozent möglich
SELECT TOP 10 PERCENT *  from orders ORDER BY freight


--die ersten 13 Bestellungen nach Frachtkosten aufsteigend...


SELECT TOP 13 WITH TIES  * from orders ORDER BY freight --14 Zeilen



--welche Bestellung hatte die höchste Positionssumme...

SELECT	 TOP 1 WITH ties
		  orderid 
		, unitprice*quantity as PosSumme
FROM [Order Details]
ORDER BY PosSumme DESC



