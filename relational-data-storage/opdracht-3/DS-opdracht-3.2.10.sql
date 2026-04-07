SELECT name, straat, huisnr, postcode 
FROM mhl_suppliers 
WHERE name LIKE '%&%'



--> antwoord

SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
WHERE name REGEXP '&[^\s]*;'