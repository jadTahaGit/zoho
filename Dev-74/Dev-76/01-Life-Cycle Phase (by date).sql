SELECT 
allPhases."Date" AS "Date",
COUNT(allPhases."Became a Lead Date") AS "Lead",
COUNT(allPhases."Became a Marketing Qualified Lead Date") AS "MQL",
COUNT(allPhases."Became a Sales Qualified Lead Date") AS "SQL",
COUNT(allPhases."Became an Opportunity Date") AS "OPP",
COUNT(allPhases."Became a Customer Date") AS "Customer"
FROM "Processed: all phases (Contacts)" AS allPhases
GROUP BY allPhases."Date"