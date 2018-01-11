--CASE
--Ausgaben k�nnen �berschrieben werden
--er werden keine Daten ver�ndert

SELECT CASE
			WHEN
			WHEN
			...
			ELSE
	   END as SPALTE, SP2, SP3
FROM TAB


SELECT country,
		CASE
			WHEN COUNTRY = 'Germany' THEN 'EU'
		END AS EUNOTEU
FROM Customers

SELECT country,
		CASE
			WHEN COUNTRY = 'Germany' THEN 'EU'
			WHEN COUNTRY = 'USA'  THEN 'AMERIKA'
			ELSE '??'
		END AS EUNOTEU
FROM Customers


SELECT country,
		CASE
			WHEN COUNTRY IN ('Germany','UK','Italy', 'France') THEN 'EU'
			WHEN COUNTRY = 'USA'  THEN 'AMERIKA'
			ELSE '??'
		END AS EUNOTEU
FROM Customers


--Orders --Freight... 0.02 - 1007 ..78.2442
--Ausgabe der Orders (orderid, freight) und ANgabe ob �ber bzw unter Schnitt



SELECT orderid, freight ,
		CASE
			WHEN freight > 78 THEN '�ber Schnitt'
			ELSE				   'unter Schnitt'
		END
FROM Orders


--Ausgabe der Orders (orderid, freight) ..
--Frachtkosten sind unsere Kosten, daher:
--Bewertung per A B C Analyse
--A  g�nstig:  unter 10
--B   normal:  unter 500
--C schlecht:  �ber oder gleich 500


SELECT orderid,
		freight,
		CASE
			WHEN freight < 10 THEN 'A'
			WHEN freight < 500 THEN 'B'
			ELSE 'C'
		END AS ABC
FROM Orders ORDER BY 3 DESC

SELECT orderid,
		freight,
		CASE
			WHEN freight < 500 THEN 'B' --ist eine Bedingung erf�llt wird keine weiterer Fall behandelt
			WHEN freight < 10 THEN 'A'			
			ELSE 'C'
		END AS ABC
FROM Orders ORDER BY 3 desc