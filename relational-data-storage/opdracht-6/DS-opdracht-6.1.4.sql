
SELECT IF(parent.name IS NULL, child.name, CONCAT(parent.name, ' - ', child.name)) AS name,
(SELECT IF(SUM(hitcount) IS NULL, 'Geen hits', SUM(hitcount)) 
 FROM mhl_suppliers_mhl_rubriek_view as RS
 JOIN mhl_suppliers as S ON S.id=RS.mhl_suppliers_ID
 JOIN mhl_hitcount as H ON H.supplier_ID=S.id
 WHERE mhl_rubriek_view_id = child.id) AS numsup
FROM mhl_rubrieken AS child
LEFT JOIN mhl_rubrieken AS parent ON child.parent = parent.id
GROUP BY name;