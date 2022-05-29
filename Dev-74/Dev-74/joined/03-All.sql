SELECT "Contacts (HubSpot CRM)".*,
if_null("DateTable"."Date", 
if_null("Became a Customer Date",
"Became an Evangelist Date"))
FROM  "Contacts (HubSpot CRM)"
FULL OUTER JOIN "DateTable" ON "Contacts (HubSpot CRM)"."Became a Customer Date"  = "DateTable"."Date"  


if_null("Became a Lead Date", 
if_null("Create Date",
if_null("Became a Marketing Qualified Lead Date",
if_null("Became a Sales Qualified Lead Date",
if_null("Became a Subscriber Date",
if_null("Became an Opportunity Date",

))))))