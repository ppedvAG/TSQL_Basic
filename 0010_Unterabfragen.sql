--Unterabfragen sind oft sehr praktisch, wenn auch seitens Performance 
--schlecht

--Unterabfragen können an verschiendenen Stellen auftauchen

--als Tabelle

Select * from (Select * from Tabelle) T --muss benannt werden

--als weitere Spalte
select SP, (select sp from tabelle)  --darf nur einen Wert zurückgeben
from Tabelle2


--als Filter

select * from tabelle 
where sp = (Select wert from tabelle2) --darf nur ein Wert zurückkommen (nur ein Spalte)


select * from tabelle 
where sp In (Select wert from tabelle2) --auch mehr Werte .. (nur eine Spalte)



select * from tabelle 
where sp > (Select wert from tabelle2) --nur ein Wert 


--
SELECT freight FROM orders  --830 Zeilen
SELECT avg(freight) FROM orders --1 Zeile 78,2442

SELECT freight - avg(freight) FROM orders --klappt nicht


--Abweichung der Frachtkosten vom Schnitt der Frachtkosten
SELECT freight -(SELECT avg(freight) FROM orders) FROM orders
ORDER BY 1 ASC


--Alle Kunden, die über UK Waren liefern liessen

SELECT * FROM dbo.Customers c
WHERE customerid IN (SELECT customerid FROM orders WHERE shipcountry = 'UK')

--where customerid in ('ALFKI', 'BLAUS', 'BSBEV'...)

--Alle Kunden, deren frachtkosten über dem schnitt der Frachtkosten liegen...)

SELECT customerid FROM orders WHERE freight > (SELECT avg(freight) FROM orders)

SELECT * FROM (
SELECT customerid,freight,
		(SELECT avg(freight) FROM orders) AS schnitt
FROM orders) T
WHERE t.Freight > t.schnitt

SELECT * FROM customers WHERE customerid IN
(
SELECT customerid FROM orders WHERE freight > (SELECT avg(freight) FROM orders)
)

--bei = im where darf nur ein Wert rauskommen
SELECT * FROM dbo.Customers c
WHERE customerid = (SELECT top 1 customerid FROM orders WHERE shipcountry = 'UK')



--Alfreds Futterkiste: BestNr mit höchsten RngSumme und kleinster RngSumme

SELECT top 1 customerid, o.orderid, min(unitprice*quantity) AS RngSumme
FROM orders o
	 INNER JOIN [Order Details] od ON od.OrderID = o.orderid
WHERE Customerid LIKE (SELECT customerid FROM customers WHERE companyname LIKE 'ALF%')
GROUP BY customerid, o.orderid 
ORDER BY RngSumme ASC

SELECT top 1 customerid, o.orderid, min(unitprice*quantity) AS RngSumme
FROM orders o
	 INNER JOIN [Order Details] od ON od.OrderID = o.orderid
WHERE Customerid LIKE (SELECT customerid FROM customers WHERE companyname LIKE 'ALF%')
GROUP BY customerid, o.orderid 
ORDER BY RngSumme DESC

SELECT * FROM 
	(
	SELECT TOP 1 customerid, o.orderid, sum(unitprice*quantity)  as RngSumme FROM orders o
	INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
	WHERE customerid = (SELECT customerid FROM customers WHERE customerid LIKE 'ALF%')
	GROUP BY customerid, o.orderid
	ORDER BY 1,3 ASC
	) T1
UNION ALL
SELECT * FROM 
	(
		SELECT TOP 1 customerid, o.orderid, sum(unitprice*quantity) AS RngSumme FROM orders o
		INNER JOIN [Order Details] od ON o.OrderID=od.OrderID
		WHERE customerid = (SELECT customerid FROM customers WHERE customerid LIKE 'ALF%')
		GROUP BY customerid, o.orderid
		ORDER BY 1,3 DESC
	) T2