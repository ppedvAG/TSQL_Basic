--IF

/*
IF (Bedingung erfüllt) Anweisung
ELSE (Bedingung nicht erfüllt) Anweisung

*/

IF (1=0) Select 'A' ELSE Select 'B'


--besser
IF (1=0) 
	Select 'A' 
ELSE 
	Select 'B'

IF (1=1)  --Falls mehr Anweisung verarbeitet werden sollen, dann BLOCK Anweisung
	BEGIN
		Select  'A' 
		Select  'C'
	END
ELSE 
	BEGIN
		Select 'B'
		select 'D'
	END

	--Man sicher nichts falsch, wenn man immer BEGIn END verwendet..


--mehr Bedigungen
--Tipp: Klamern verwenden

IF (1=1) OR (2=1)
	Begin 
			print 'Servus'
	End

IF (1=1) AND (2=1)
	Begin 
			print 'Servus'
	End
ELSE
	BEGIN
			print 'falsch'
	END

--Wenn wir mehr als 50 Kunden haben, dann Ausgabe der Kundentabelle

IF (Select ..) > Wert


IF ((Select count(*) from customers) > 50)
Begin
	select * from customers
End
ELSE
	select 'weniger als fuffzisch!'