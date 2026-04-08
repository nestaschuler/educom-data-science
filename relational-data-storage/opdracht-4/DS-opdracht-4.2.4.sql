SELECT S.name AS Supplier, 
PT.name as Propertytype, 
IFNULL(YN.content, 'NOT SET') as VALUE
FROM mhl_suppliers AS S
CROSS JOIN mhl_propertytypes AS PT
JOIN mhl_cities AS CT ON S.city_ID = CT.id
LEFT JOIN mhl_yn_properties AS YN ON YN.supplier_ID = S.id AND YN.propertytype_ID = PT.id
WHERE CT.name='Amsterdam' AND PT.proptype='A';