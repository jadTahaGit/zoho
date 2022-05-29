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
JOIN "DateTable" ON  
"Contacts (HubSpot CRM)"."Became a Customer Date" != "DateTable"."Date" OR
"Contacts (HubSpot CRM)"."Became a Lead Date" = "DateTable"."Date" OR
"Contacts (HubSpot CRM)"."Became a Sales Qualified Lead Date" = "DateTable"."Date" OR
"Contacts (HubSpot CRM)"."Became a Subscriber Date" = "DateTable"."Date" OR
"Contacts (HubSpot CRM)"."Became an Opportunity Date" = "DateTable"."Date" OR
"Contacts (HubSpot CRM)"."Became an Evangelist Date" = "DateTable"."Date" OR
"Contacts (HubSpot CRM)"."Close Date" = "DateTable"."Date" 
