--Order by ..sortieren der Ergebnisse

--select * from tabelle where sp = wert ORDER BY SP1 asc, SP2 desc, SP3 asc
--default = ascending


select * from customers order by country --nach Land aufsteigend

select * from customers order by country desc --nach Land absteigend

select country as Land, * from customers order by country desc --nach Land absteigend

--Sortieren benötigt nicht nur bei der Ausgabe, sondern auch zum Validieren der Ergebnisse


--nenne die geringsten Frachtkosten in Orders


select * from orders order by freight --0.02
select * from orders order by freight desc --1007.64

--wann braucht man denn eine weiter Spalte zum sortieren?

select country, city, companyname from customers order by country, city
--falls es mehrfachwerte in Sp1 gibt... LAND..STADT zb

--alle Bestellungen ausgebe lassen
--deren Bruttofrachtgkosten geringer als 100 sind
--sortiert ausgeben

--Ausgabe: Frachtbrutto sortiert aufsteigend, orderid, customerid, freight
--Brutto: dt MwSt 19%

select * from orders where freight *1.19< 100
--besser...
select * from orders where freight < 100/1.19--..besser

select freight*1.19 as Bruttofracht , * from orders
 where freight *1.19< 100
 order by bruttofracht asc


 --wieso ist diese Tabelle sortiert

 select * from customers --immer sortiert

 insert into customers(CustomerID, CompanyName) values('PPEDV','PPEDV AG')

 select * into Kunden from customers

 select * from kunden--nicht sortiert

  insert into kunden(CustomerID, CompanyName) values('EURIM','EURIM AG')

  --sortieren ist teuer: 72% der Leistung
  select * from kunden order by customerid


  --0 % für Sortierung, da der SQL weiß, dass die Daten nach customerid sortiert sind
   select * from customers order by customerid

   --nur sortieren, wenn man es wirklich braucht!!


 select freight*1.19 as Bruttofracht , * from orders
 where		Bruttofracht < 100 --geht nicht
 order by   Bruttofracht asc

 --Logischer Fluss.. das from kommt zuerst, dann das where, dann der SELECT und dann 
--order by..
--daher Bruttofracht erst im Order by verwendbar







select 84.033613*1.19

select * from orders





