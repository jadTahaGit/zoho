SELECT
		 Cast(newTable."Close Date" as date) AS Date,
		 COUNT(newTable."Contact ID") AS Closed
FROM (	SELECT
			 "Contact ID",
			 "Close Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Close Date" 
HAVING newTable."Close Date"  IS NOT NULL  
ORDER BY newTable."Close Date" ASC 
