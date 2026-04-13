SELECT IF(parent.name IS NULL, child.name, CONCAT(parent.name, ' - ', child.name)) AS name,
(SELECT COUNT(mhl_suppliers_id) 
 FROM mhl_suppliers_mhl_rubriek_view 
 WHERE mhl_rubriek_view_id = child.id) AS numsup
FROM mhl_rubrieken AS child
LEFT JOIN mhl_rubrieken AS parent ON child.parent = parent.id
GROUP BY name;