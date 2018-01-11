--VARIABLEN

/*
werden deklariert

declare @variable as int 

Variablen haben immer ein oder zwei @ am Namensbeginn



@var: lokale Variable: Zugriff nur aus der Erstellerverbindung heraus
						Gültigkeit: nur solange ein Batch läuft

@@var:globale Variable: Zugriff auch aus anderen Verbidungen heraus
						Gülrtigkeit: solange ein Batch läuft




*/

DECLARE @var AS int
SET @var = 10
SELECT @var



DECLARE @var2 AS int
SET @var2 = 10
GO --Batchdelimiter
SELECT @var2 --jetzt ist Variable weg


--Wert zuweisen:

SET @var = Wert

--Wert aus DB zuweisen

SELECT @var=count(*) FROM Tabelle

--man darf aber folgendes nicht:
--Abfragen und Zuweise ist nicht erlaubt


DECLARE @anzahl AS int

SELECT @anzahl=count(*), sum(freight) FROM orders --geht nicht

SELECT @anzahl


--Wofür Variablen: 
--Code wird teilweise deutlich übersichtlicher
--einfacher
--dynmaischer
--aber Variblen sind kein Performancemonster

DECLARE @Land AS varchar(50)
SET @land = 'USA'

SELECT * FROM customers WHERE country = @Land

SELECT * FROM employees WHERE country = @land



--alle Bestellungen deren Frachtkosten über dem Schnitt liegen

--gestern: Kunden , Frachtkosten, Frachtkostenabweichung vom Schnitt
--         bei denen die Frachtkosten über dem Schnitt liegen
SELECT	customerid,
		freight-(SELECT avg(freight) FROM orders) 
FROM	orders 
WHERE	freight > (SELECT avg(freight) FROM orders)



DECLARE @Schnitt AS money
SELECT @schnitt = avg(freight) FROM orders

SELECT	customerid, freight, freight - @schnitt
FROM	Orders
WHERE	freight > @schnitt


--Schnellzuweisung
DECLARE @variable AS int = 100, @variable2 AS money = 1000.12
SELECT @variable

SET @variable = @variable *10
SET @variable = @variable2 * @variable

SELECT @variable
SELECT @variable2

--Falls du einer Variablen keinen Wert zuweist, besitzt diese den Wert NULL
--Tipp: @var > 0 --> NULL




--Varibalen braucht man vor allem bei F() und Prozeduren...!
--Grundsätzlich gibts auch Tabellenvariablen <--> temp. Tabellen
--Tabellenvariablen eher nur bei seihr kleinen Tabellen.. < 1000 Zeilen


USE nwindbig;
GO

SELECT * FROM customers WHERE customerid = 'aaaan'

DECLARE @kunde AS char(5) = 'aaaan'
SELECT * FROM customers WHERE customerid = @kunde