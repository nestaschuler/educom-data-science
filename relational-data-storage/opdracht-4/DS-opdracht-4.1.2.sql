SELECT mhl_suppliers.name, straat, huisnr, postcode, mhl_cities.name AS plaatsnaam FROM mhl_suppliers 
JOIN mhl_cities ON mhl_suppliers.city_ID = mhl_cities.id
JOIN mhl_communes ON mhl_cities.commune_ID = mhl_communes.ID
WHERE mhl_communes.name = 'Steenwijkerland'