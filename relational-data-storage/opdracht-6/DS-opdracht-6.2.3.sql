SELECT DAYNAME(joindate) AS 'dag van de week', 
COUNT(id) AS aantal
FROM mhl_suppliers 
GROUP BY DAYNAME(joindate), DAYOFWEEK(joindate)
ORDER BY DAYOFWEEK(joindate)