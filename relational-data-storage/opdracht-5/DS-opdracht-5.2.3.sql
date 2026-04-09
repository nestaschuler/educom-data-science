SELECT 
H.year,
SUM(IF(H.Month IN (1, 2, 3), hitcount, 0)) As 'Eerste Kwartaal',
SUM(IF(H.Month IN (4, 5, 6), hitcount, 0)) As 'Tweede Kwartaal',
SUM(IF(H.Month IN (7, 8, 9), hitcount, 0)) As 'Derde Kwartaal',
SUM(IF(H.Month IN (10, 11, 12), hitcount, 0)) As 'Vierder Kwartaal',
SUM(H.hitcount) AS 'Totaal'
FROM mhl_hitcount as H 
GROUP BY H.year