SELECT S.name, S.straat, S.huisnr, s.postcode, R.name FROM mhl_suppliers_mhl_rubriek_view AS SR
JOIN mhl_suppliers AS S ON SR.mhl_suppliers_ID = S.Id
JOIN mhl_rubrieken as R ON SR.mhl_rubriek_view_id = R.id
JOIN mhl_cities AS C ON S.city_ID = C.id 
LEFT JOIN mhl_rubrieken AS PR ON R.parent=PR.id
WHERE C.name = 'Amsterdam' AND (R.name = 'drank' OR PR.name='drank')
ORDER BY R.name, S.name 