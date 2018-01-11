/*
Select 'TXT', Mathe, Spalten, f(Spalten) as ALIAS
FROM  TABELLE
WHERE 
		SPALTE <>, !=, <, >, >=, <= , like , = , IN, Between
		f(Spalte) ....
		AND|OR

		IN:			Suche nach SP1=WertX oder SP1=wertY oder SP1=WertZ
		BETWEEN:    SP1 >= WERT1  AND SP1 <= Wert2

ORDER BY SP ASC, SP2 DESC, ALIAS DESC


Wildcards (nur bei Like):
		% ... beliebig viele Zeichen
		_ ... steht f�r ein Zeichen genau
		[]... steht f�r ein Zeichen, deckt allerdings einen Werteberich ab
				[A-C|G-K|2-6] 
Sonderzeichensuche:
		% ... [%]  alternative like 'AB!%XYZ' ESCAPE '!'  aus !% wird suche nach % Zeichen
		' ... ''  



*/

--Welche Bestellungen sind an einem Montag gemacht worden 
--und wurde �ber England verschifft
--und haben Frachtkosten zwischen 10 und 100


SELECT   datename(dw,orderdate),* from ORDERS
where	datename(dw,orderdate)='Montag' 
		AND
		shipcountry = 'UK'
		AND
		freight between 10 AND 100

--Vergleich per > < mit Buchstaben ist legitim, aber aufapssen.. --> Telefonbuch
--was ist gr��er als U ..UK ist gr��er
Select * from orders where shipcountry > 'U'



