SELECT C.name, IFNULL(CM.name, 'INVALID') AS gemeente
FROM mhl_cities AS C
LEFT JOIN mhl_communes AS CM ON CM.id = C.commune_id