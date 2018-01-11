USE Northwind;
GO

--INNER JOIN...

Select *
from  Customers inner join orders on customers.customerid=orders.customerid
--830 Zeilen, da die orders 830 Zeilen hat

--Schreibweise etwas umständlich...noch.. ;-)
Select *, c.*, O.*, c.CustomerID,c.CompanyName,o.OrderID, o.freight 
FROM
		Customers C 
					inner join Orders O
							   ON C.CustomerID=O.CustomerID
where c.country = 'UK'



--APEX 0 Euro, Redgate, Idera.. CodeEditor


--Welches Produkt (ProduktID) wurde mehr als 10 mal pro Bestellung verkauft
--und sind aus England verschifft unund hatten Frachtkosten unter 10

Select od.ProductID, od.Quantity, o.freight, o.ShipCountry 
from 
	Orders O inner join [Order Details] OD 
				ON o.orderid = OD.OrderID
where 
	o.shipcountry = 'UK' AND o.freight <10
	AND OD.Quantity>10


--LEFT und RIGHT JOIN funktionieren absolut identisch
--Welche Kunden haben nichts gekauft....


select c.CustomerID, o.CustomerID 
from 
		Customers C 
				left join orders o on c.CustomerID=o.CustomerID
where 
	o.CustomerID is null


--jeder Kunde, der nichts kaufte hat in der Orders-Ausgabe eine NULL

--Suchen nach NULL..
select * from tabellen where sp is null ---!


--jede mathem. Operation mit NULL führt wieder zu einem NULL
select 'a'+0 --Error
select 'A' + NULL --NULL

--NULL ist nicht : 0 aber auch nicht ''



--schreibe den left join als right join


select c.CustomerID, o.CustomerID 
from orders o 
		
				right join Customers C on c.CustomerID=o.CustomerID
where 
	o.CustomerID is null


--Gibt es verwaiste Kunden?

select * from 
			orders o 
				left join customers c on c.CustomerID=o.CustomerID
		where c.CustomerID is null



--JOINS über mehr Tabellen


SELECT *
FROM
		TAB1 t1 inner join TAB2 t2 ON t1.sp1=t2.sp3
				inner join TAB3 t3 ON t2.sp2=t3.sp4
				inner join TAB4 t4 On t3.sp5=t4.sp1

--Liste aller Kunden und deren bestelltes Produkt (Produktname)
--sortieren nach Firma und dann Produktname

Select DISTINCT CompanyName, p.ProductName from 
		Customers C INNER JOIN
		ORDERS O  ON c.CustomerID=O.CustomerID
					INNER JOIN [Order Details] OD
				  ON OD.OrderID=o.orderid
					INNER JOIN Products P
				  ON P.productid = OD.ProductID
order by 1,2

--Der Distinct filtert aus der Ergebnismenge doppelte Zeilen aus..
--den Distinct nur verwenden, wenn man ihn auch wirklich braucht
--zb doof: Distinct auf PK Spalten

--Welcher Angestellte hat welchem Kunden, welches Produkt verkauft..?


Select   distinct
		  e.lastname + ' ' + e.firstname as Angestellter
		, c.CompanyName as Firma
		, p.ProductName as Produkt
from 
			  customers C inner join orders o			on c.CustomerID=o.CustomerID
						  inner join [Order Details] OD on od.OrderID=o.OrderID
						  inner join Employees  E		on e.EmployeeID=o.EmployeeID
						  inner join products p			on p.ProductID=od.ProductID
order by	  Angestellter
			, Firma
			, Produkt


select count(*) from  customers, orders, [order details]  --160 ..........

select * from customers cross join employees








--Welche Produkte wurden über England verschifft und hatten weniger als 10 Frachtkosten


