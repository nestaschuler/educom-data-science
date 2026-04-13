CREATE VIEW months (id, name) AS 
  SELECT 1,'Januari'
  UNION SELECT 2,'Februari'
  UNION SELECT 3,'Maart'
  UNION SELECT 4,'April'
  UNION SELECT 5,'Mei'
  UNION SELECT 6,'Juni'
  UNION SELECT 7,'Juli'
  UNION SELECT 8,'Augustus'
  UNION SELECT 9,'September'
  UNION SELECT 10, 'Oktober'
  UNION SELECT 11,'November'
  UNION SELECT 12,'December';

  SELECT year as jaar,
  months.name as maand,
  number_suppliers as 'aantal leveranciers',
  total_hitcount as 'totaal aantal hits'
  FROM (SELECT year, month, COUNT(Supplier_ID) as number_suppliers, SUM(hitcount) as total_hitcount
  FROM mhl_hitcount
  GROUP BY year, month) 
  as totals 
  JOIN months ON month=months.id
  ORDER BY YEAR DESC, months.name ASC