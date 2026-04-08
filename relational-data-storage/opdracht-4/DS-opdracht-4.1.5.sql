SELECT S.name, S.straat, S.huisnr, S.postcode, P.lat, P.lng
 FROM mhl_suppliers AS S 
 JOIN pc_lat_long AS P ON P.pc6=S.postcode 
 ORDER BY p.lat DESC 
 LIMIT 5