SELECT 
Cast(newTable."Became an Opportunity Date" as date)AS Date,
COUNT(newTable."Contact ID") AS OPP
FROM (
SELECT 
"Contact ID",
"Became an Opportunity Date"
FROM "Contacts (HubSpot CRM)" 
)
AS newTable
GROUP BY newTable."Became an Opportunity Date"
HAVING newTable."Became an Opportunity Date"  IS NOT NULL 
ORDER BY newTable."Became an Opportunity Date" ASC