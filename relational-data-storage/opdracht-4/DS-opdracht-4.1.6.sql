SELECT H.hitcount, S.name as levernaciersnaam, 
CT.name as plaatsnaam, 
CM.name as gemeentenaam, 
D.name as provincienaam
FROM mhl_hitcount as H 
JOIN mhl_suppliers as S ON S.id=H.supplier_id
JOIN mhl_cities AS CT ON CT.id=S.city_id
JOIN mhl_communes AS CM ON CM.id=CT.commune_id
JOIN mhl_districts AS D ON D.id=CM.district_id
JOIN mhl_countries as CO ON CO.id=D.country_id
WHERE H.year=2014 AND H.month=1 
AND D.name IN ('Limburg', 'Noord-Brabant', 'Zeeland')