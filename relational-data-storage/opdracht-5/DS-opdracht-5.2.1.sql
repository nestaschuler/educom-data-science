SELECT S.name as leverancier, 
IF(CT.name IS NULL, 't.a.v. de directie', CT.name) AS aanhef,
IF(S.p_address<> '', S.p_address, CONCAT(S.straat,' ', S.huisnr)) AS adres,
IF(S.p_address<>'', S.p_postcode, S.postcode) AS postcode,
IF(S.p_address<>'', PC.name, V.name) AS stad,
IF(S.p_address<>'', PD.name, VD.name) AS provincie
FROM mhl_suppliers AS S
LEFT JOIN mhl_contacts AS CT ON S.id=CT.supplier_id
LEFT JOIN mhl_cities AS PC ON PC.id=S.P_City_id
LEFT JOIN mhl_communes AS PCM ON PCM.id=PC.commune_id
LEFT JOIN mhl_districts AS PD ON PD.id=PCM.district_Id
LEFT JOIN mhl_cities AS V ON V.id=S.city_ID
LEFT JOIN mhl_communes AS VC ON VC.id=V.commune_id
LEFT JOIN mhl_districts AS VD ON VD.id=VC.district_ID
WHERE postcode<>''
ORDER BY 
    IF(S.p_address<>'', PD.name, VD.name),
    IF(S.p_address<>'', PC.name, V.name),
    S.name