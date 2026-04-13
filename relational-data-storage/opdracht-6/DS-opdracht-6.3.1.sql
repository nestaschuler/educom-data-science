SELECT CONCAT(UPPER(SUBSTRING(name, 1, 1)), SUBSTRING(name, 2)) AS plaatsnaam
FROM mhl_cities
ORDER BY name

