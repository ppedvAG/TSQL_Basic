/*
Verwendung von F()

select f(wert), SP from f(wert) where f(SP) > f(wert)

Bedenke F() sind meist seitens performance schlecht--> SCAN


*/

create function f_zahl(@par1 int, @par2 int) returns int
as
BEGIN	
	return (select @par1*@par2)
END
GO

select dbo.f_zahl(2,4)

select freight, dbo.f_Zahl(freight, employeeid) from orders


create function fbrutto (@netto as money) returns money
as
Begin
	return (select @netto * 1.19)
end

select orderid, freight, dbo.fbrutto(freight) as Brutto from orders


--f(): fRngSumme(Bnr) ==> Rechnungsumme



select dbo.fRngSumme(10248)


create function fRngSumme(@BestNr as int) returns money
as
Begin
	return (select sum(unitprice*quantity) from [order details] where orderid = @BestNr)
End

--Idee

select  dbo.frngsumme(orderid),* from orders where  dbo.frngsumme(orderid) > 1000


alter table orders2
add RngSumme as dbo.frngsumme(orderid)

select * from orders2 where rngsumme > 1000

---dbo.fbrutto-- Bruttowert


