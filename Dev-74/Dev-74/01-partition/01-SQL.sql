SELECT 
Cast(newTable."Became a Sales Qualified Lead Date" as date)AS Date,
COUNT(newTable."Contact ID") AS SQL
FROM (
SELECT 
"Contact ID",
"Became a Sales Qualified Lead Date"
FROM "Contacts (HubSpot CRM)" 
)
AS newTable
GROUP BY newTable."Became a Sales Qualified Lead Date"
HAVING newTable."Became a Sales Qualified Lead Date"  IS NOT NULL 
ORDER BY newTable."Became a Sales Qualified Lead Date" ASC