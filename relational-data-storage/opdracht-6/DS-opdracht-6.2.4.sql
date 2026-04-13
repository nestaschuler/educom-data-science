SELECT YEAR(joindate) as Jaar, 
MONTHNAME(joindate) as maand, 
COUNT(id) as aantal 
FROM mhl_suppliers 
GROUP BY YEAR(joindate), MONTH(joindate) 
ORDER BY jaar, month(joindate)