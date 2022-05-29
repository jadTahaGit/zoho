SELECT 
Cast(newTable."Create Date" as date)AS Date,
COUNT(newTable."Contact ID") AS "New Contact"
FROM (
SELECT 
"Contact ID",
"Create Date"
FROM "Contacts (HubSpot CRM)" 
)
AS newTable
GROUP BY newTable."Create Date"
HAVING newTable."Create Date"  IS NOT NULL 
ORDER BY newTable."Create Date" ASC