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
cast("Became a Customer Date" as date) AS "Became a Customer Date",
"Email",
"Phone Number",
cast("Became a Lead Date" as date) AS "Became a Lead Date",
"Website URL",
cast("Create Date" as date) AS "Create Date",
cast("Became a Marketing Qualified Lead Date" as date) AS "Became a Marketing Qualified Lead Date",
"Original Source Label",
cast("Became a Sales Qualified Lead Date" as date) AS "Became a Sales Qualified Lead Date",
cast("Became a Subscriber Date" as date) AS "Became a Subscriber Date",
cast("Became an Opportunity Date" as date) AS "Became an Opportunity Date",
cast("Became an Evangelist Date" as date) AS "Became an Evangelist Date",
"Original Source",
cast("Close Date" as date) AS "Close Date",
"HubSpot Score",
"City",
"Number of Associated Deals",
"State/Region",
"Total Revenue",
"Date"
FROM "Contacts (HubSpot CRM)"
FULL OUTER JOIN "DateTable" 
ON "Contacts (HubSpot CRM)"."Became a Customer Date"  = "DateTable"."Date" AND
"Contacts (HubSpot CRM)"."Became a Lead Date" = "DateTable"."Date" AND
"Contacts (HubSpot CRM)"."Became a Sales Qualified Lead Date" = "DateTable"."Date" AND
"Contacts (HubSpot CRM)"."Became a Subscriber Date" = "DateTable"."Date" AND
"Contacts (HubSpot CRM)"."Became an Opportunity Date" = "DateTable"."Date" AND
"Contacts (HubSpot CRM)"."Became an Evangelist Date" = "DateTable"."Date" AND
"Contacts (HubSpot CRM)"."Close Date" = "DateTable"."Date" 
