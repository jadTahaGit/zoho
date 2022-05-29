SELECT
		 Cast(newTable."Became a Marketing Qualified Lead Date" as date) AS Date,
		 COUNT(newTable."Contact ID") AS MQL
FROM (	SELECT
			 "Contact ID",
			 "Became a Marketing Qualified Lead Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Became a Marketing Qualified Lead Date" 
HAVING newTable."Became a Marketing Qualified Lead Date"  IS NOT NULL  
ORDER BY newTable."Became a Marketing Qualified Lead Date" ASC 
