SELECT id, 
DATE_FORMAT(joindate, '%d-%m-%Y') AS joindate,
DATEDIFF(CURDATE(), joindate) AS dagen_lid
FROM mhl_suppliers
ORDER BY dagen_lid ASC