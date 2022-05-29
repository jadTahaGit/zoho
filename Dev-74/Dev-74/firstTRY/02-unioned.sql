SELECT
0 AS "Date",
"Contact ID",
"Company Name",
"Create Date"
FROM "Contacts (HubSpot CRM)" 
UNION ALL
SELECT
"Date",
0 AS "Contact ID",
0 AS "Company Name",
0 AS "Create Date"
FROM "DateTable"  



SELECT
"Contact ID",
"Company Name",
"Create Date"
FROM "Contacts (HubSpot CRM)" 
RIGHT JOIN
"DateTable" 


-- Nuller 
SELECT
"Date",
0 AS "Contact ID",
0 AS "Company Name",
0 AS "Create Date"
FROM
"DateTable"
JOIN
"Contacts (HubSpot CRM)" on 


SELECT
0 AS "Date",
"Contact ID",
"Company Name",
"Create Date"
FROM "Contacts (HubSpot CRM)" 
UNION ALL
SELECT
"Date",
0 AS "Contact ID",
0 AS "Company Name",
0 AS "Create Date"
FROM "DateTable"  