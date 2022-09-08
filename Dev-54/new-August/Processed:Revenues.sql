SELECT
		 "PlannedRevenues"."DueDate" AS "DueDate",
		 "PlannedRevenues"."TotalCalculated" AS "Revenue",
		 "PlannedRevenues"."NetTotal" AS "TargetRevenue",
		 NULL AS "BusinessplanRevenue",
		 "PlannedRevenues"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 0 AS "RegularClient",
		 0 AS "RegularProject",
		 "PlannedRevenues"."ProjectId" AS "ProjectId",
		 "Projects"."Name" AS "ProjectName",
		 "PlannedRevenues"."Probability" AS "Probability",
		 'Pipeline' AS "RevenueType",
		 'Default' AS "Case"
FROM  "PlannedRevenues"
JOIN "Leads" ON "Leads"."Id"  = "PlannedRevenues"."LeadId" 
LEFT JOIN "Companies" ON "Companies"."Id"  = "PlannedRevenues"."CompanyId" 
LEFT JOIN "Projects" ON "Projects"."Id"  = "PlannedRevenues"."ProjectId"  
WHERE	 ("PlannedRevenues"."LeadId"  != 0
 AND	"PlannedRevenues"."LeadId"  != 'null'
 AND	"PlannedRevenues"."LeadId"  IS NOT NULL)
 AND	"PlannedRevenues"."Status"  = 'Planned'
 AND	"Leads"."StatusId"  != 54010
UNION ALL
 SELECT
		 "Invoices"."InvoiceDate" AS "DueDate",
		 "Invoices"."NetTotal" AS "Revenue",
		 "Invoices"."NetTotal" AS "TargetRevenue",
		 NULL AS "BusinessplanRevenue",
		 "Invoices"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 "Projects"."Bestandsprojekt" AS "RegularClient",
		 
			CASE
				 WHEN IS_EMPTY("Projects"."Bestandsprojekt")  = 1 THEN 0
				 ELSE "Projects"."Bestandsprojekt"
			 END AS "RegularProject",
		 "Invoices"."ProjectId" AS "ProjectId",
		 "Projects"."Name" AS "ProjectName",
		 100 AS "Probability",
		 'Invoiced' AS "RevenueType",
		 'Default' AS "Case"
FROM  "Invoices"
LEFT JOIN "Companies" ON "Companies"."Id"  = "Invoices"."CompanyId" 
LEFT JOIN "Projects" ON "Projects"."Id"  = "Invoices"."ProjectId"  
WHERE	 "Invoices"."Status"  != 'Draft'
UNION ALL
 SELECT
		 "Invoices"."InvoiceDate" AS "DueDate",
		 "Invoices"."NetTotal" AS "Revenue",
		 "Invoices"."NetTotal" AS "TargetRevenue",
		 NULL AS "BusinessplanRevenue",
		 "Invoices"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 "Projects"."Bestandsprojekt" AS "RegularClient",
		 "Projects"."Bestandsprojekt" AS "RegularProject",
		 "Invoices"."ProjectId" AS "ProjectId",
		 "Projects"."Name" AS "ProjectName",
		 100 AS "Probability",
		 'Draft' AS "RevenueType",
		 'Default' AS "Case"
FROM  "Invoices"
LEFT JOIN "Companies" ON "Companies"."Id"  = "Invoices"."CompanyId" 
LEFT JOIN "Projects" ON "Projects"."Id"  = "Invoices"."ProjectId"  
WHERE	 "Invoices"."Status"  = 'Draft'
UNION ALL
 SELECT
		 "PlannedRevenues"."DueDate" AS "DueDate",
		 "PlannedRevenues"."NetTotal" AS "Revenue",
		 "PlannedRevenues"."NetTotal" AS "TargetRevenue",
		 NULL AS "BusinessplanRevenue",
		 "PlannedRevenues"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 0 AS "RegularClient",
		 0 AS "RegularProject",
		 "PlannedRevenues"."ProjectId" AS "ProjectId",
		 "Projects"."Name" AS "ProjectName",
		 "PlannedRevenues"."Probability" AS "Probability",
		 'Accrual' AS "RevenueType",
		 'Default' AS "Case"
FROM  "PlannedRevenues"
LEFT JOIN "Companies" ON "Companies"."Id"  = "PlannedRevenues"."CompanyId" 
LEFT JOIN "Projects" ON "Projects"."Id"  = "PlannedRevenues"."ProjectId"  
WHERE	 ("PlannedRevenues"."ProjectId"  = 0
 OR	"PlannedRevenues"."ProjectId"  = 'null'
 OR	"PlannedRevenues"."ProjectId"  IS NULL)
 AND	("PlannedRevenues"."LeadId"  = 0
 OR	"PlannedRevenues"."LeadId"  = 'null'
 OR	"PlannedRevenues"."LeadId"  IS NULL)
 AND	"PlannedRevenues"."Status"  = 'Planned'
UNION ALL
 SELECT
		 "PlannedRevenues"."DueDate" AS "DueDate",
		 "PlannedRevenues"."TotalCalculated" AS "Revenue",
		 "PlannedRevenues"."NetTotal" AS "TargetRevenue",
		 NULL AS "BusinessplanRevenue",
		 "PlannedRevenues"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 "Projects"."Bestandsprojekt" AS "RegularClient",
		 "Projects"."Bestandsprojekt" AS "RegularProject",
		 "PlannedRevenues"."ProjectId" AS "ProjectId",
		 "Projects"."Name" AS "ProjectName",
		 "PlannedRevenues"."Probability" AS "Probability",
		 'Planned' AS "RevenueType",
		 'Default' AS "Case"
FROM  "PlannedRevenues"
LEFT JOIN "Companies" ON "PlannedRevenues"."CompanyId"  = "Companies"."Id" 
LEFT JOIN "Projects" ON "Projects"."Id"  = "PlannedRevenues"."ProjectId"  
WHERE	 ("PlannedRevenues"."ProjectId"  != 0
 AND	"PlannedRevenues"."ProjectId"  != 'null'
 AND	"PlannedRevenues"."ProjectId"  IS NOT NULL)
 AND	("PlannedRevenues"."LeadId"  = 0
 OR	"PlannedRevenues"."LeadId"  = 'null'
 OR	"PlannedRevenues"."LeadId"  IS NULL)
 AND	"PlannedRevenues"."Status"  = 'Planned'
UNION ALL
 SELECT
		 "Processed: Businessplan"."Date" AS "DueDate",
		 NULL AS "Revenue",
		 NULL AS "TargetRevenue",
		 "Processed: Businessplan"."Revenue" AS "BusinessplanRevenue",
		 "Companies"."Id" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 "Processed: Businessplan"."RegularClient" AS "RegularClient",
		 "Processed: Businessplan"."RegularClient" AS "RegularProject",
		 NULL AS "ProjectId",
		 NULL AS "ProjectName",
		 -100 AS "Probability",
		 'Businessplan' AS "RevenueType",
		 "Processed: Businessplan"."Case" AS "Case"
FROM  "Processed: Businessplan"
LEFT JOIN "Companies" ON "Processed: Businessplan"."CompanyId"  = "Companies"."Id"  
 
 
 
 
 
