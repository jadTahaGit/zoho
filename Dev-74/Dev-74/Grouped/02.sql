SELECT
COUNT(unionedTable."Became a Customer Date") AS "Became a Customer" ,
COUNT(unionedTable."Became a Lead Date") AS "Became a Lead",
COUNT(unionedTable."Became a Marketing Qualified Lead Date") AS "MQL",
COUNT(unionedTable."Became a Sales Qualified Lead Date") AS "SQL",
COUNT(unionedTable."Became a Subscriber Date") AS "Subscriber",
COUNT(unionedTable."Became an Opportunity Date") AS "Opportunity",
COUNT(unionedTable."Became an Evangelist Date") AS "Evangelist",
COUNT(unionedTable."Close Date" ) AS "Closed",
unionedTable."Date" AS "Date"
FROM 
(
SELECT
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
"Became a Customer Date",
"Email",
"Phone Number",
"Became a Lead Date",
"Website URL",
"Create Date",
"Became a Marketing Qualified Lead Date",
"Original Source Label",
"Became a Sales Qualified Lead Date",
"Became a Subscriber Date",
"Became an Opportunity Date",
"Became an Evangelist Date",
"Original Source",
"Close Date" ,
"HubSpot Score",
"City",
"Number of Associated Deals",
"State/Region",
"Total Revenue"
FROM "Contacts (HubSpot CRM)" 
JOIN "(Processed): DateTable - Hubspot"
) AS unionedTable
GROUP BY unionedTable."Became a Customer Date"


