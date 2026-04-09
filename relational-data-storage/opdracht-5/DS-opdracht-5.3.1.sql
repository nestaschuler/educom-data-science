CREATE VIEW DIRECTIE AS
SELECT CO.supplier_ID as SupplierId,
CO.name AS name, 
CO.contacttype AS functie,
DP.name AS Department
FROM mhl_contacts AS CO
LEFT JOIN mhl_departments AS DP ON CO.department=DP.id
WHERE CO.contacttype LIKE '%directeur%' OR DP.name='Directie'
