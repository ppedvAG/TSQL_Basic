--die wo -- WHERE

/*
...where spalte 
				= 
				>
				<
				<=
				>=
				!=
				<>
				like 
				IN
				BETWEEN

			spalte > wert and|or spalte < wert



*/

SELECT * from Orders
	where orderid = 10250 --Direkter Vergleich mit = 

select * from Orders
	where orderid < 10250 --Exklusive 10250


select * from Orders
	where orderid <= 10250  --inklusive 10250


select * from orders
	where orderid != 10250 --alle ausser dem 10250 --NON SARG (searchable argument).. schlechte Performance


select * from orders
	where orderid <> 10250


--alle Datensätze EmplID  größer 2 aber auch kleiner 5
select * from orders
	where employeeid > 2 AND employeeid < 5 --Spalte muss wiederholt werden ---283 Zeilen


--alle Bestellungen mit Frachtkosten zwischen 100 und 200 (inklusive)
select * from orders
	where freight >= 100 and freight <= 200 --114

--Erleichterung
select * from orders
	where freight between 100 and 200 --between ist die Kurzform für >= und <= 


--alle Bestellungen, die entweder von EmplID 2 oder Employeeid 9 bearbeitet wurden

select * from orders
	where employeeid = 2 OR employeeid = 9 --139

--Erleichterung

select * from orders
	where employeeid IN (2,9) --139 --IN Kurzform für Spalte = wert oder Spalte = andere Wert..


--Suche nach ungenauen Werten... ? zB wenn  man nur einen Teil des Suchbegriffes kennt
--LIKE
--nur like kennt Vergleich mit Wildcards: %

--% steht für 0 bis beliebig viele Zeichen

select * from customers
	where 
			companyname LIKE 'A%' --alle Kunden, die mit A beginnend

select * from customers
	where 
			CompanyName LIKE '%A' -- alle die auf A enden.. immer schlechte Suche NON SARG

--Alle mit y im Firmennamen aus Customers

select * from customers
	where
		companyname like '%y%'

--Fies ;-) 
--Suche nach allen, die im Namen ein ' haben...
--Suche nach allen, die im Namen ein % haben...

--alle Kunden mit '
select * from customers where CompanyName

--alle Kunden mit %
select * from customers where CompanyName LIKE '%%%'  -- genausogut wie ein %



--Tabelle: Order Details
select * from [order details] --eckige Klammern stellen so etwas wie eine Wertebereich dar


-- % muss innerhalb ein eckigen Klammer stehen.. ==> Wertebereich
select * from customers where CompanyName LIKE '%[%]%'  -- genausogut wie ein %


--und das Hochkomma?
select * from customers where CompanyName LIKE '%['']%'  -- genausogut wie ein %

select * from customers where CompanyName LIKE '%''%'  -- genausogut wie ein %

--'' das erste ' ist der Escape Hinweis für den SQL Server  und damit wird aus '' ein ' 

select * from customers where CompanyName like '%!%%' ESCAPE '!'


--Suche nach alle Kunden, die
--entweder aus UK, usa oder Frankreich stammen
--oder aus Berlin und ROM
--und im Firmenname ein a haben

--ohne Klammersetzung immer schlecht.. 
--der das Statement später mal ansieht wird nicht wissen, ob das Ergebnis gewollt war
--SQL Server bindet das AND immer stärker
select * from customers
where 
		country IN ('UK', 'USA', 'France')
		OR
		City IN ('Berlin' , 'rom')
		AND
		Companyname like '%d%'


		--entspricht dem
select * from customers
where 
		country IN ('UK', 'USA', 'France')
		OR
		(
		City IN ('Berlin' , 'rom')
		AND
		Companyname like '%d%'
		)

		--gewünscht wäre aber evtl das gewesen
		--alle Firmen müssen ein D im Namen haben.. 
select * from customers
where 
		(
		country IN ('UK', 'USA', 'France')
		OR
		City IN ('Berlin' , 'rom')
		)
		AND
		Companyname like '%d%'


--Die Setzung von Klammern kann nur zu richtigen Ergebnissen führen..
--ohne Klammern evtl was falsches...


--Alle Kunden aus einem Land mit A, B, C, D, E beginnend

select * from customers
where
	country IN ('A%', 'B%', 'C%', 'D%','E%') --klappt nicht 
	--.. IN sucht mit =  , bei = aber keine Wildcard

select * from customers
where 
		country like 'A%' OR country like 'B%' --usw.. ginge! ..dauert aber ... bäh

select * from customers	
		where 
			substring(country,1,1) IN ('A','B','C','D','E')

--etwas kürzer..
select * from customers	
		where 
			Left(country,1) IN ('A','B','C','D','E')
--ist aber genauso schlecht wie das darüber...;-)

--besser:
select * from customers
where
	country like '[A-E]%'

---die [] steht für ein Zeichen genau
--A-E inklusive Grenzen.. 1-5 geht auch

--nicht bloß einfacher zu schreiben und zu lesen
--schneller!

--Ein funktion im where um eine Spalte führt zu einem SCAN (= A bis Z Suche)..besser wäre SEEK


--Datumsabfrage
--alle Bestellungen von 1997


select datepart(yy,orderdate),* from orders
	where datepart(yy,orderdate) =1997




select * from orders
	where year(orderdate) =1997

	--das muss def. nicht richtig sein..warum..orderdate = datetime
select * from orders
	where orderdate between '1.1.1997' and '31.12.1997' --alles vom 31.12 nach 0 Uhr wird nicht genommen


--besser wäre
select * from orders
	where orderdate between '1.1.1997' and '31.12.1997 23:59:59.999' --aber das ist auch falsch


--statt between..
--andert aber nix..gleiche Problem
select * from orders
	where orderdate >= '1.1.1997' and orderdate <= '31.12.1997'

--kann aber auch falsch sein
select * from orders
	where orderdate >= '1.1.1997' and orderdate < '1.1.1998'

--bei Datum (datetime) Vorsicht
--datetime wird intern als INT gespeicher
--der 31.12.2018 23:59:59.999 = 1.1.2019 00:00:00.000 identisch
--Verwende datetime nur dann, wenn du es wirklich brauchst...!!



--Der Wertebereich kann auch erweitert werden
-- [A-C|P-S]
--genau ein Zeichen: A bis C oder auch P bis S

--alle Kunden aus einem Land , das mit A bis C oder P bis S beginnt

select * from customers where country like '[A-C|P-S]%'

select * from customers where country like '[A|C|P|S]%' --läßt man die  | weg bleibts das gleiche

--Suche nach alle Firmen, die als 2ten Buchstaben im Firmenamen ein "o" habe

--Wildcard für genau ein Zeichen: _

select * from customers where CompanyName like '_o%'

--somit kann man auch folgendes suchen :
--alle Kunden, die mit A-C oder mit H bis P beginnen und als vorletzten Buchstaben ein i haben

select * from customers
	where CompanyName like '[A-C|H-P]%i_'

--wie könnte rein theoretisch eine PIN definiert werden..

where pin like '____' --abcd--falsch
where pin like '[0-9][0-9][0-9][0-9]'
where password like '[0-9|a-z|@&!][0-9|a-z|@&!][0-9|a-z|@&!][0-9|a-z|@&!][0-9|a-z|@&!][0-9|a-z|@&!][0-9|a-z|@&!]'
