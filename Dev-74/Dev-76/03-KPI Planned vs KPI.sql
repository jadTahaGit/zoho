SELECT 
"Processed: all phases (Contacts)"."Date" AS "Date",
"Sales KPI Planned"."Planned Lead" AS "Planned Lead" ,
"Processed: all phases (Contacts)"."Became a Lead Date" AS "Lead",
"Sales KPI Planned"."Planned MQL" AS "Planned MQL",
"Processed: all phases (Contacts)"."Became a Marketing Qualified Lead Date" AS "MQL",
"Sales KPI Planned"."Planned SQL" AS "Planned SQL",
"Processed: all phases (Contacts)"."Became a Sales Qualified Lead Date" AS "SQL",
"Sales KPI Planned"."Planned OPP" AS "Planned OPP",
"Processed: all phases (Contacts)"."Became an Opportunity Date" AS "OPP",
"Sales KPI Planned"."Planned Customer" AS "Planned Customer",
"Processed: all phases (Contacts)"."Became a Customer Date" AS "Customer" 
FROM "Processed: all phases (Contacts)" 
FULL OUTER JOIN 
"Sales KPI Planned"
on "Processed: all phases (Contacts)"."Date" = "Sales KPI Planned"."Date"


SELECT 
"Processed: all phases (Contacts)"."Date" AS "Date",
"Processed: all phases (Contacts)"."Became a Lead Date" AS "Lead",
"Processed: all phases (Contacts)"."Became a Marketing Qualified Lead Date" AS "MQL",
"Processed: all phases (Contacts)"."Became a Sales Qualified Lead Date" AS "SQL",
"Processed: all phases (Contacts)"."Became an Opportunity Date" AS "OPP",
"Processed: all phases (Contacts)"."Became a Customer Date" AS "Customer" 
FROM "Processed: all phases (Contacts)" 
FULL OUTER JOIN 
"Sales KPI Planned"
on "Processed: all phases (Contacts)"."Date" = "Sales KPI Planned"."Date"

