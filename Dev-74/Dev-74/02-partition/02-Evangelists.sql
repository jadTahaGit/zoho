SELECT
		 Cast(newTable."Became an Evangelist Date" as date) AS Date,
			 if(COUNT(newTable."First Name")>1,'Multiple First Names',MIN(newTable."First Name")) AS "First Name",
			 if(COUNT(newTable."Last Name")>1,'Multiple Last Names',MIN(newTable."Last Name")) AS "Last Name",	
			  if(COUNT(newTable."Annual Revenue")>1,'Multiple Annual Revenue',MIN(newTable."Annual Revenue")) AS "Annual Revenue",
			  if(COUNT(newTable."Associated Company ID")>1,'Multiple Associated Company IDs',MIN(newTable."Associated Company ID")) AS "Associated Company ID",	
			  if(COUNT(newTable."Company Name")>1,'Multiple Company Names',MIN(newTable."Company Name")) AS "Company Name",	
			  if(COUNT(newTable."Country/Region")>1,'Multiple Country/Regions',MIN(newTable."Country/Region")) AS "Country/Region",	
			  if(COUNT(newTable."Contact owner")>1,'Multiple Contact owners',MIN(newTable."Contact owner")) AS "Contact owner",	
			  if(COUNT(newTable."Branche")>1,'Multiple Branches',MIN(newTable."Branche")) AS "Branche",				  
			  if(COUNT(newTable."Associated Deals")>1,'Multiple Associated Deals',MIN(newTable."Associated Deals")) AS "Associated Deals",	
			  if(COUNT(newTable."Lifecycle Stage")>1,'Multiple Lifecycle Stages',MIN(newTable."Lifecycle Stage")) AS "Lifecycle Stage",				  
			  if(COUNT(newTable."Lead Status")>1,'Multiple Lead Status',MIN(newTable."Lead Status")) AS "Lead Status",	
			  COUNT(newTable."Contact ID") AS Evangelists
FROM (	SELECT
			 "Contact ID",
			 "First Name",	
			 "Last Name", 
			 "Annual Revenue",
			 "Associated Company ID",
			 "Company Name",
			 "Country/Region",
			 "Contact owner",
			 "Branche",
			 "Associated Deals",
			 "Lifecycle Stage",
			 "Lead Status",
			 "Email",
			 "Phone Number",
			 "Website URL",
			 "Became an Evangelist Date"
	FROM  "Contacts (HubSpot CRM)" 
) AS  newTable 
GROUP BY  newTable."Became an Evangelist Date" 
HAVING newTable."Became an Evangelist Date"  IS NOT NULL  
ORDER BY newTable."Became an Evangelist Date" ASC 
