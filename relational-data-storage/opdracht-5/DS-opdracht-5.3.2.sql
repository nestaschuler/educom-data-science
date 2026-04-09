CREATE VIEW Verzendlijst AS
SELECT S.ID, 
IF(S.P_address<>'', S.P_address, CONCAT(S.straat, ' ', S.huisnr)) as adres,
IF(S.P_postcode<>'',S.P_postcode, S.postcode) as postcode,
IF(S.P_address<>'', CP.name, C.name) AS Stad
FROM mhl_suppliers as S
LEFT JOIN mhl_cities as C ON S.city_ID=C.id
LEFT JOIN mhl_cities as CP ON S.p_city_id=CP.id
