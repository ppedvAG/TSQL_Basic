--Prozeduren.. stored procedures

/*
i.d.R schneller 
kann man als Batch verstehen

exec Procname par1, par2


in der Prozedur können alle Arten von Anweisungen vielfach enthalten
--meist komplette BI Logik

--Code liegt auf dem Server


create procedure procname @par1 int, @par2 int
as
---Code



*/

create procedure gpdemo @par1 int, @par2 int
as
select @par1*@par2


exec gpdemo 2,100


alter procedure gpdemo @par1 int
as
select * from orders where freight < @par1


exec gpdemo 1

exec kundensuche --Customerid char(5)

--Kundensuche 'ALFKI --1 Treffer
--Kundensuche 'A' --  4  Treffer
--Kundensuche '%' --alle

create proc KundenSuche @Kunde char(5)
as
select * from customers where customerid like @Kunde +'%'
--like nicht =

exec kundensuche 'ALFKI'



ALTER proc KundenSuche @Kunde char(5)
as
select * from customers where customerid like @Kunde +'%'
--like nicht =
--dann unbedingt Go nach der Proc, sonst sind alle nachfolgenden
--markierten Anweisungen Bestandteil der Prozedur
GO 

exec kundensuche 'A'


ALTER proc KundenSuche @Kunde char(5)
as
select * from customers where customerid like @Kunde +'%'
--like nicht =
--dann unbedingt Go nach der Proc, sonst sind alle nachfolgenden
--markierten Anweisungen Bestandteil der Prozedur
--char(5) sind 5 Zeichen.  also auch 'A....%'
GO 


ALTER proc KundenSuche @Kunde varchar(10)
as
select * from customers where customerid like @Kunde +'%'
--like nicht =
--dann unbedingt Go nach der Proc, sonst sind alle nachfolgenden
--markierten Anweisungen Bestandteil der Prozedur
--char(5) sind 5 Zeichen.  also auch 'A....%'
GO 

exec kundensuche ''

--Kann man auch 
exec kundensuche --ohne Paramater..mit default Wert


ALTER proc KundenSuche @Kunde varchar(10)='%'
as
select * from customers where customerid like @Kunde +'%'
--like nicht =
--dann unbedingt Go nach der Proc, sonst sind alle nachfolgenden
--markierten Anweisungen Bestandteil der Prozedur
--char(5) sind 5 Zeichen.  also auch 'A....%'
GO 

exec kundensuche 


--was geht nicht so einfach

--Prozeduren sind "nicht" mit JOINs VIEWs etc verknüpfbar..


--Kann man wenigstens Ergebnisse der Prozedur weiterverarbeiten..?
--temp Tabelle

--Outputparamater!



ALTER proc KundenSuche @Kunde varchar(10), @Land as varchar(50)
as
select * from customers where customerid like @Kunde +'%'
			AND COUNTRY = @Land
--like nicht =



--zwingend Reihenfolge @par = wert
exec kundensuche @Land='UK', @Kunde='A'



Alter proc gpdemo2 @par1 int, @par2 int output --Output ist auch input
as
set @par2=@par1*100
select @par2

GO


exec gpdemo2 50 --erwartet immer noch @par2 als INput 

declare @variable as int = 100


exec gpdemo2 @par1=50, @par2=@variable output

select @variable

