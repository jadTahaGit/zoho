SELECT
		 Cast(newTable."Became a Lead Date" as date) AS Date,
		 COUNT(newTable."Contact ID") AS LEAD
FROM (	SELECT
			 "Contact ID",
			 "Became a Lead Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Became a Lead Date" 
HAVING newTable."Became a Lead Date"  IS NOT NULL  
ORDER BY newTable."Became a Lead Date" ASC 
