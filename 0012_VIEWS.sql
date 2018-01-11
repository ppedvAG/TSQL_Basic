--Views--Sichten

--eine gemerkte benannte Abfrage
--Sichten verhalten sich wie Tabelen
--Sichten enthalten kein Daten
--Sichten erleichtern oft Abfragen..da komplexe JOINS nur noch Hintergrund gemacht werden
--wg Security!
--Sichten können wie Tabellen: INS, UP, DEL..aber nicht immer

select * from employees

create view vEmp
as
select Lastname, phone, country, city from employees where country = 'UK'


--Idee: tab Employees ZUgriff verweigern, dafür Zugriff auf reduzierte Sicht 
--funktioniert

create view KundenUK
as
select * from customers where country = 'UK';
GO


select * from kundenUK;
GO


create view KundeBestDaten
as
Select   
		  e.lastname + ' ' + e.firstname as Angestellter
		, c.CompanyName as Firma
		, p.ProductName as Produkt
		, o.orderid
		, o.freight
		, o.orderdate
		, o.shipcity, o.shipcountry
		, od.unitprice, od.Quantity, (od.unitprice* od.Quantity)as PosSumme
		, p.productid
from 
			  customers C inner join orders o			on c.CustomerID=o.CustomerID
						  inner join [Order Details] OD on od.OrderID=o.OrderID
						  inner join Employees  E		on e.EmployeeID=o.EmployeeID
						  inner join products p			on p.ProductID=od.ProductID
GO 


Select Firma, sum(Possumme) from KundeBestDaten where shipcountry = 'UK'
group by Firma



--Schlechtes TSQL!!
--weil die View immer alle Joins macht, egal ob man sie für die Abfrage gerade braucht!!


select distinct Firma from KundeBestDaten where firma like 'A%'

select Companyname from Customers where CompanyName like 'A%'




select var(zahl) from tabvar


create  ---> alter ---> drop

--Ändern der Sicht
alter  view KundeBestDaten
as
select getdate() as Datum

select * from KundeBestDaten


drop view KundeBestDaten