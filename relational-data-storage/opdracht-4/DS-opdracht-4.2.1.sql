SELECT name, commune_id 
FROM MHL_cities AS C
LEFT JOIN mhl_communes AS CM ON CM.id=C.commune_id
WHERE mhl_communes IS NULL 