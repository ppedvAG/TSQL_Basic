--Systemfunktionen

--Datum, Text..

---DATUM

select getdate() -- aktuelle Datum und Uhrzeit in ms

--Datumsteile herausfinden
--datepart(yy|mm|dd|hh|ss.., Datum)



select datepart(mm,'8.1.2018') --1
select datepart(yy,'8.1.2018') --2018

select datepart(qq,'8.8.2018') --Quartal 3

select datepart(hh,'8.8.2018') --00.... datetime wird ergänzt um 00:00:00.000

--Abkürzungen
select year('20.8.1997'), month('20.8.1997'), day('20.8.1997'), EOMONTH('20.8.1997')


--zu einem Datum etwas dazuzählen: dateadd
select dateadd(dd,100,'8.1.2018')
--welcher Tag war vor 100 Tagen?

select dateadd(dd,-100,getdate())


---Zeit zwischen zwei Terminen: datediff
select datediff(dd,'8.1.2018','1.1.2018') --  -7
select datediff(dd,'1.1.2018','8.1.2018') --   7

select datediff(dd,'1.1.2018','8.1.2018') --   7


select abs(-7), abs( datediff(dd,'8.1.2018','1.1.2018') )

---wieviele Tage sind seit der Geburt vergangen:

select datediff (dd,getdate(), '20.7.1969') --Tage seit Mondlandung

--Welcher Wochentag, Welches Monat??  datename

select datename(mm, getdate()) --Januar
select datename(dd, getdate()) -- 8
select datename(dw, getdate()) -- Montag



---wieviele Tage sind seit der Geburt vergangen:



--Welcher Wochentag, Welches Monat??  datename

select datename(mm, getdate()) --Januar

select datename(dd, getdate()) --8 ??
select datename(dw, getdate()) --Montag..!!

---################   TEXT

--LEFT & RIGHT
select left('abcdefg',2)  --ab
select right('abcdefg',2) --fg

--SUBSTRING.. ab der xten Position für einen best. Länge Zeichen ausgeben
select substring('abcdefg',3,2) --cd

--Längen
select len('Otto'), len ('Otto           '),len ('   Otto           ')  --   4    4    7

--LEN schneidet Leerzeichen am Ende der ZK weg.. siehe char(50) bie Otto

--inklusive der Leerzeichen
select datalength('otto'),datalength('otto         ')  --4      13
select datalength('Otto            ')-len('Otto            ')

--REVERSE (Palindrom)

select reverse('Ein Neger mit Gazelle zagt im Regen nie')


--SOUNDEX: Soudmalerisch gedacht
--Suche nach [Maier]

select soundex('Maier'), soundex('Meyer'), soundex('Meyr')

--STUFF--Substring plus Ersetzen von Zeichen

select stuff('abcdefg',3,2,'x')



select 'a' + 'b' --ab
select 'a' - 'b' --geht nicht
select  2 + 'a' --Error
select 'a' + 2  --Error
select '2' + 'a'  --2a-  durch implizite Konvertieren

--Telefonummer ausixen: 08677-988971 --> 08677-988xxx
--Ziel: egal welche Nummer.. die letzten 3 ziffern müssen ausgeixt worden sein

select stuff('08677-98811971', datalength('08677-98811971')-2,3,'xxx')

select reverse((stuff(reverse('08677-988971'),1,3,'xxx')))

select left('08677-988971',datalength('08677-988971')-3) + 'xxx'























