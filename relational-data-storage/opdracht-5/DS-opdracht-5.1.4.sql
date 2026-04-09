SELECT S.name as name, 
SUM(H.hitcount) as numhits, 
COUNT(*) as nummonths, 
AVG(H.hitcount) as avgpermonth
FROM mhl_hitcount AS H
JOIN mhl_suppliers AS S ON S.id=H.supplier_ID
GROUP BY name
HAVING numhits>100
ORDER BY avgpermonth DESC