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
contactsTable."Contact ID",
contactsTable."First Name",	
contactsTable."Last Name", 
contactsTable."Annual Revenue",
contactsTable."Associated Company ID",
contactsTable."Company Name",
contactsTable."Country/Region",
contactsTable."Contact owner",
contactsTable."Branche",
contactsTable."Associated Deals",
contactsTable."Lifecycle Stage",
contactsTable."Lead Status",
contactsTable."Became a Customer Date",
contactsTable."Email",
contactsTable."Phone Number",
contactsTable."Became a Lead Date",
contactsTable."Website URL",
contactsTable."Create Date",
contactsTable."Became a Marketing Qualified Lead Date",
contactsTable."Original Source Label",
contactsTable."Became a Sales Qualified Lead Date",
contactsTable."Became a Subscriber Date",
contactsTable."Became an Opportunity Date",
contactsTable."Became an Evangelist Date",
contactsTable."Original Source",
contactsTable."Close Date" ,
contactsTable."HubSpot Score",
contactsTable."City",
contactsTable."Number of Associated Deals",
contactsTable."State/Region",
contactsTable."Total Revenue"
FROM "Contacts (HubSpot CRM)" AS contactsTable
JOIN "(Processed): DateTable - Hubspot" AS dateTable
ON contactsTable."Became a Customer Date"=dateTable."Date"
) AS unionedTable
GROUP BY unionedTable."Became a Customer Date"


