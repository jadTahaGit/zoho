SELECT
		 Cast(newTable."Became a Subscriber Date" as date) AS Date,
		 COUNT(newTable."Contact ID") AS Subscribers
FROM (	SELECT
			 "Contact ID",
			 "Became a Subscriber Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Became a Subscriber Date" 
HAVING newTable."Became a Subscriber Date"  IS NOT NULL  
ORDER BY newTable."Became a Subscriber Date" ASC 
