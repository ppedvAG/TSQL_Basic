--WHILE

/*
WHILE (Bedingung) AND|OR (Bedingung)
	BEGIN
			Anweisungen
	END


*/

declare @i as int = 0

while @i < 5
	begin
		select @i
		set @i = @i +1
	end


/*
WHILE (Bedingung|Select ...)
	BEGIN
			Anweisungen
			BREAK --unterbricht die Schleife sofort... Ende des While
			CONTINUE --springt zum Schleifenanfang, der Rest des While wird nun
					 ---nun nicht mehr ausgeführt
			Anweisungen
	END

--Aufpassen bei Schleifen:

Kopfgesteuerte und Fussgesteuerte Schleifen
aber in SQL nur die kopfgesteuerten Schleifen

*/


declare @i as int = 0

while @i < 10
	begin
		select @i
		IF @i=5 BREAK --bei 5 ist Schleife wg BREAK sofort zu Ende
		set @i = @i +1
	end


declare @i as int = 0

while @i < 10
	begin
		select @i
		IF @i=5 Continue --bei 5 ist Schleife wg BREAK sofort zu Ende
		set @i = @i +1 --jetzt wird diese Zeile nicht ausgeführt, Endless Schleife
	end


declare @i as int = 0

while @i < 10
	begin
		select @i
		IF @i = 6 Continue
		IF @i=5 BREAK --bei 5 ist Schleife wg BREAK sofort zu Ende
		set @i = @i +1 --jetzt wird diese Zeile nicht ausgeführt, Endless Schleife
	end



create table ttt (id int identity, spx char(4100))

insert into ttt
select 'xyz'
Go 20000

select * into tttt from ttt




--Erhöhe die Frachtkosten um 10% , solange bis
--max Fracht 1500 erreicht hat oder Summe der Frachtkosten 90000
--kein  Wert darf überschritten werden

select max(freight), sum(freight) from orders2




begin tran
--Code
while		 (select max(freight) from orders2) < 1500/1.1
	    AND  (select sum(freight) from orders2)  < 90000/1.1
Begin
	update orders2 set freight = freight *1.1
	
end

select max(freight), sum(freight) from orders2
rollback


--
begin tran
--Code
while		 (select max(freight) from orders2) < 1500
	    AND  (select sum(freight) from orders)  < 90000
Begin
	update orders2 set freight = freight *1.1
end

select max(freight), sum(freight) from orders2
rollback

create procedure gpFrachterhoehung @prozent decimal(2,1), @maxfracht as int,@Summfracht int
as
begin tran
--Code
while		 (select max(freight) from orders2) <  @maxfracht/@prozent
	    AND  (select sum(freight) from orders2)  <  @Summfracht/@prozent
Begin
	update orders2 set freight = freight *@prozent	
end

select max(freight), sum(freight) from orders2
rollback
