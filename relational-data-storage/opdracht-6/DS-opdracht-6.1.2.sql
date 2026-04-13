SELECT CM.name As gemeente, 
S.name AS leverancies, 
sum(hitcount) as total_hitcount
FROM mhl_communes as CM 
JOIN mhl_cities as CT ON CT.commune_id = CM.id
JOIN mhl_suppliers as S ON S.city_Id = CT.id
JOIN mhl_hitcount as H ON H.supplierID = S.id
JOIN mhl_districts as D ON D.id = CM.district_id
JOIN mhl_countries as CO ON CO.id = D.country_id
WHERE CO.name = 'Nederland'
GROUP BY CM.name, S.name

query 2: //hier gemiddelde hitcount per gemeente
SELECT CM.name, AVG(hitcount) as gem_hitcount 
FROM mhl_communes as CM 
JOIN mhl_cities as CT ON CT.commune_ID=CM.id 
JOIN mhl_suppliers as S ON CT.id=S.city_id 
JOIN mhl_hitcount as H ON H.supplier_id=S.id 
JOIN mhl_districts as D ON D.id = CM.district_id
JOIN mhl_countries as CO ON CO.id = D.country_id
WHERE CO.name = 'Nederland'
group by CM.name;

SELECT totals.gemeente, 
totals.leveranciers, 
totals.total_hitcount, 
gem.gem_hitcount, 
totals.total_hitcount - gem.gem_hitcount AS verschil
from (query 1) as totals 
JOIN (query 2) as gem ON gem.name = totals.gemeente
WHERE totals.total_hitcount > gem.gem_hitcount
ORDER BY verschil DESC 

Nu bij elkaar voegen:

SELECT totals.gemeente, 
totals.leveranciers, 
totals.total_hitcount, 
gem.gem_hitcount, 
totals.total_hitcount - gem.gem_hitcount AS verschil
from (SELECT CM.name As gemeente, 
S.name AS leveranciers, 
sum(hitcount) as total_hitcount
FROM mhl_communes as CM 
JOIN mhl_cities as CT ON CT.commune_id = CM.id
JOIN mhl_suppliers as S ON S.city_Id = CT.id
JOIN mhl_hitcount as H ON H.supplier_ID = S.id
JOIN mhl_districts as D ON D.id = CM.district_id
JOIN mhl_countries as CO ON CO.id = D.country_id
WHERE CO.name = 'Nederland'
GROUP BY CM.name, S.name
) as totals 
JOIN (SELECT CM.name, AVG(hitcount) as gem_hitcount 
FROM mhl_communes as CM 
JOIN mhl_cities as CT ON CT.commune_ID=CM.id 
JOIN mhl_suppliers as S ON CT.id=S.city_id 
JOIN mhl_hitcount as H ON H.supplier_id=S.id 
JOIN mhl_districts as D ON D.id = CM.district_id
JOIN mhl_countries as CO ON CO.id = D.country_id
WHERE CO.name = 'Nederland'
group by CM.name) as gem ON gem.name = totals.gemeente
WHERE totals.total_hitcount > gem.gem_hitcount
ORDER BY totals.gemeente ASC, verschil DESC