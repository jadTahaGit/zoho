SELECT 
contacts."Primary Associated Company ID",
COUNT(contacts."Contact ID")
FROM  "Contacts (HubSpot CRM)" AS contacts
GROUP BY contacts."Primary Associated Company ID"