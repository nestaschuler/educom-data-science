SELECT S.name, 
IFNULL(D.name, 't.a.v. directie') AS contact,
V.adres, 
V.postcode, 
V.stad 
FROM mhl_suppliers as S
LEFT JOIN directie as D ON D.supplierID=S.id
LEFT JOIN verzendlijst as V ON V.id=S.id
