--Aggregate
--SUM(), MIN(), MAX(), COUNT(), AVG()
CHECKSUM_AGG SUM 
COUNT STDEV 
COUNT_BIG STDEVP 
GROUPING VAR 
GROUPING_ID VARP 



SELECT AGG() FROM TAB --ok

SELECT SP, AGG() FROM TAB --Error

--die Frage, die man sich stellt ist eigtl
--AGG pro ??!!

--WIe hoch sind die Frachtkosten pro Land?
--GROUP BY Verwendung

SELECT shipcountry, sum(freight) AS SummeFracht FROM orders
GROUP BY SHIPCOUNTRY

SELECT Shipcountry, shipcity , sum(freight) FROM orders
GROUP BY SHipcountry, shipcity

--Syntax
--SELECT zuerst: Was willst du sehen
--IM GROUP BY stehen alle Spalten des SELECT nur die AGG nicht

SELECT Shipcountry, shipcity , sum(freight), var(freight) FROM orders
GROUP BY Shipcountry, shipcity 

--Wieviele Kunden gibt es pro Land

SELECT country, count(*) FROM dbo.Customers c
group by country
ORDER BY 2 DESC


--Welcher Kunde , hat wieviel Umsatz generiert..?
--Liste Firma, Umsatz...

---zuerst Abfrage mit Firma und RngSumme

SELECT Companyname , sum((unitprice*quantity)) as UMSATZ FROM customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID
INNER JOIN dbo.[Order Details] od ON od.OrderID = o.OrderID
GROUP BY  Companyname 
ORDER BY 2 desc


SELECT TOP 1 Companyname , sum((unitprice*quantity)) as UMSATZ 
FROM customers c
				INNER JOIN orders o               ON c.CustomerID = o.CustomerID
				INNER JOIN dbo.[Order Details] od ON od.OrderID = o.OrderID
GROUP BY  Companyname 
ORDER BY 2 DESC


--Pro Firma die Rechnungssummen?
SELECT    companyname AS Firma
		, o.orderid
	   , sum(unitprice*quantity) as RngSumme
FROM customers c
				INNER JOIN orders o               ON c.CustomerID = o.CustomerID
				INNER JOIN dbo.[Order Details] od ON od.OrderID = o.OrderID
GROUP BY     companyname 
		, o.orderid






--HAVING


SELECT country, count(*) as Anzahl FROM customers
GROUP BY country HAVING count(*) > 10


--das Having ist das where des GROUP BY
--filtere nie mit Having, was du mit where filtern kannst
--in einem Having kommen eigtl nur Aggregate vor

SELECT country, count(*) as Anzahl FROM customers
GROUP BY country HAVING count(*) >  '1%'


--ginge..wenn sinnvoll ;-)
SELECT country, count(*) as Anzahl FROM customers
GROUP BY country HAVING count(*) LIKE  '1%'



-- with cube | with rollup
SELECT country,city, count(*) as Anzahl FROM customers
GROUP BY country, city              --62 Zeilen

--hierarchische Aggregate
SELECT country,city, count(*) as Anzahl FROM customers
GROUP BY country, city WITH ROLLUP  --93 Zeilen

--Superaggregate
SELECT country,city, count(*) as Anzahl FROM customers
GROUP BY country,city WITH CUBE     --163 Zeilen