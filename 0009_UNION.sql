--Kunden sind Länder und Städten
--Angstellte sind in Ländern und Städten

--Social Networking in Bayern?... Vetternwirtschaft

-- eine Liste mit allen "Kontakten" mit Land und Stadt

--KName, Land, Stadt, Typ(Kd oder Ang)

select companyname, country, city,  'Kunde' as Typ from customers 
UNION
select lastname,    country, city , 'Angestellter' from employees


--der UNION verbindet 2 oder mehr selects zu einer Ausgabe
--aber es muss folgendes gelten:
--alle Abfragen müssen gleich viele Spalten anbieten
--Spalten müssen auch kompatibel seitens des Datentyps sein
--zb lassen sich Zahlen und Buchstaben nicht kombinieren

select companyname, country, city,  'Kunde' as Typ, NULL as GebDatum from customers 
UNION
select lastname,    country, city , 'Angestellter', birthdate from employees


--es werden nur die Aliase des ersten SELECTS verwendet..
select companyname, country, city,  'Kunde' as Typ, NULL as GebDatum from customers 
UNION
select lastname,    country, city , 'Angestellter', birthdate as Purzeltag from employees

--??

select 'A'
UNION
Select 'B'
--A
--B

select 'A'
UNION
Select 'A'
--A

--??

--der UNION macht automatisch einen DISTINCT auf die Ergebnismenge!!
--wenn man das nicht möchte

select 'A'
UNION   ALL --filtert keine doppelten Ergebniszeilen raus
Select 'A'

---, 
--alle Kontakte aus UK--  die Angstellter sind 
select companyname, country, city,  'Kunde' as Typ from customers 
UNION ALL
select lastname,    country, city , 'Angestellter' from employees
Where country = 'UK' --bezieht sich hier nur auf Employees!!!!
order by country

--und wie kann man nach der Spalte Typ filtern
--nur Unterabfrage



select * from (tabellenartiges)

select * from (select * from customers) c


select * from 
(
	select companyname, country as Land, city,  'Kunde' as Typ, NULL as GebDatum from customers 
	UNION
	select lastname,    country, city , 'Angestellter', birthdate from employees
) T
where T.Typ='Angestellter' and land='UK'
order by Land


--das geht nicht
select companyname, country as Land, city,  'Kunde' as Typ, NULL as GebDatum from customers order by city 
UNION
select lastname,    country, city , 'Angestellter', birthdate from employees


--Ausgabe: orderid, freight
--die lt Frachtkosten günstigste und teuerste Bestellung

--leider geht das nicht
Select top 1 orderid , freight from orders order by freight asc
UNION ALL
Select top 1  orderid , freight from orders order by freight desc

--Trick: Unterabfragen
select * from 
(Select top 1 orderid , freight from orders order by freight asc)  T1
UNION ALL
select * from 
(Select top 1  orderid , freight from orders order by freight desc) T2