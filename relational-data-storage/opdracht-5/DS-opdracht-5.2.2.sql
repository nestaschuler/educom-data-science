SELECT 
CT.name as Stad, 
COUNT(CASE WHEN membertype=1 THEN 1 END) as Gold,
COUNT(CASE WHEN membertype=2 THEN 1 END) as Silver,
COUNT(CASE WHEN membertype=3 THEN 1 END) as Bronze,
COUNT(CASE WHEN membertype NOT IN (1, 2, 3) THEN 1 END) as Other
FROM mhl_cities as CT
JOIN mhl_suppliers as S ON CT.id=S.city_id
GROUP BY CT.name 
ORDER BY Gold DESC, Silver DESC, Bronze DESC;