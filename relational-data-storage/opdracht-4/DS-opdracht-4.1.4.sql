SELECT S.name, S.straat, S.huisnr, S.postcode 
FROM mhl_yn_properties AS PS
JOIN mhl_suppliers AS S ON PS.supplier_ID=S.ID
JOIN mhl_propertytypes AS P ON PS.propertytype_ID = P.id
WHERE P.name='specialistische leverancier' OR p.name='ook voor particulieren'