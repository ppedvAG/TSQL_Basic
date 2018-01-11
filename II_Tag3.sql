--TAG3

/*
SELECT  DISTINCT TOP 10 [Percent] [WITH TIES]
		 'TXT'  AS ALIAS
		 , SPALTEN
		 , F()
		 , Mathe
		 , AGG (SUM(),MIN(),MAX(),COUNT(),AVG())
		 , (SELECT Abfrage) --darf nur einen Wert zurückgeben
FROM   TAB|VIEWS|(SELECT...) as T
			INNER|LEFT|RIGHT|CROSS
						ON T.SP=V.SP AND T.Sp2=V.SP2
									 AND ...
WHERE
GROUP BY .. HAVING 
ORDER BY



						

*/


--Welche Kunden  sind im gleichen Land und Stadt wie ein Angestellter?
SELECT    Companyname AS Firma
		, Lastname + ', ' + Firstname AS Angestellter
		, C.Country, C.City, E.Country, E.City
FROM
		Customers C
				INNER JOIN Employees E ON c.Country	=e.country
								AND		  c.city	=e.city	

--Alle Angestellten und deren ptoentielle Stellvertreter?
--Lastname (Krank), Land, stadt, Land , Stadt, Stellvertreter


SELECT 
		e1.lastname, e1.firstname, e1.country,e1.city, --KRANK
		e2.lastname, e2.firstname, e2.country,e2.city  --Stellvertreter
FROM 
		Employees e1 INNER JOIN employees e2 
							ON  e1.country=e2.country
							AND e1.city=e2.city
							AND e1.employeeid != e2.employeeid
									

--Kunden .. LAND, Anzahl der Kunden

--Alle Länder , in denen mehr als 10 Kunden sind


--per Unterabfrage
SELECT * FROM 
(
SELECT country, count(*) as Anzahl FROM customers
GROUP BY country
) T
WHERE anzahl > 10


--per #tabelle
SELECT country, count(*) as Anzahl 
INTO #t1
FROM customers
GROUP BY country;

SELECT * FROM #t1 WHERE anzahl > 10;

DROP TABLE #t1
GO

---oder: ;-) HAVING

SELECT country, count(*) as Anzahl FROM customers
GROUP BY country HAVING count(*) > 10
