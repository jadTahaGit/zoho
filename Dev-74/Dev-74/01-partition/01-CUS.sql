SELECT
		 Cast(newTable."Became a Customer Date" as date) AS Date,
		 COUNT(newTable."Contact ID") AS CUS
FROM (	SELECT
			 "Contact ID",
			 "Became a Customer Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Became a Customer Date" 
HAVING newTable."Became a Customer Date"  IS NOT NULL  
ORDER BY newTable."Became a Customer Date" ASC 
