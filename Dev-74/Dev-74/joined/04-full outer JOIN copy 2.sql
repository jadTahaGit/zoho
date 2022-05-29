SELECT *
FROM  "Contacts (HubSpot CRM)"
FULL OUTER JOIN "DateTable" ON "Contacts (HubSpot CRM)"."Became a Customer Date"  = "DateTable"."Date"  
