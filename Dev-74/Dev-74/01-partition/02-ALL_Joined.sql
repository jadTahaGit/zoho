SELECT
		 "Processed: LEAD"."Date" AS "Date",
		 "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: LEAD" 
UNION ALL
SELECT
		 "Processed: New Contact"."Date" AS "Date",
		 0 AS "LEAD",
		 "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: New Contact" 
UNION ALL
 SELECT
		 "Processed: MQL"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: MQL" 
UNION ALL
 SELECT
		 "Processed: SQL"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: SQL" 
UNION ALL
 SELECT
		 "Processed: OPP"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: OPP" 
UNION ALL
 SELECT
		 "Processed: CUS"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: CUS" 
UNION ALL 
SELECT
		 "Processed: Subscribers"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "Processed: Subscribers" 
UNION ALL
SELECT
		 "Processed: Evangelists"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 "Evangelists",
		 0 AS "Closed"
FROM  "Processed: Evangelists"
UNION ALL
SELECT
		 "Processed: Closed"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS "Evangelists",
		 "Closed"
FROM  "Processed: Closed"
UNION ALL
SELECT
		 "DateTable"."Date" AS "Date",
		 0 AS "LEAD",
		 0 AS "New Contact",
		 0 AS "MQL",
		 0 AS "SQL",
		 0 AS "OPP",
		 0 AS "CUS",
		 0 AS "Subscribers",
		 0 AS"Evangelists",
		 0 AS "Closed"
FROM  "DateTable" 
WHERE	 "Date"  < today()