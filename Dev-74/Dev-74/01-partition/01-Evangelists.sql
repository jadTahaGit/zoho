SELECT
		 Cast(newTable."Became an Evangelist Date" as date) AS Date,
		 COUNT(newTable."Contact ID") AS Evangelists
FROM (	SELECT
			 "Contact ID",
			 "Became an Evangelist Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Became an Evangelist Date" 
HAVING newTable."Became an Evangelist Date"  IS NOT NULL  
ORDER BY newTable."Became an Evangelist Date" ASC 
