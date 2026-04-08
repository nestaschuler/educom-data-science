SELECT C1.name as C1_name, C2.name as C2_name, 
C1.id as C1_id, 
C2.id as C2_id, 
C1.commune_id as Commune_id1, 
C2.commune_id as Commune_id2,
CM1.name AS gemeente_1,
CM2.name AS gemeente_2
FROM mhl_cities AS C1 
JOIN mhl_cities as C2 ON C1.name=C2.name
JOIN mhl_communes as CM1 ON CM1.id=C1.commune_ID
JOIN mhl_communes as CM2 ON CM2.id=C2.commune_ID
WHERE C1.id<C2.id
ORDER BY C1.name;