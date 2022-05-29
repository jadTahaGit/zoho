SELECT
		 "Processed: Revenues"."DueDate" AS "DueDate",
		 0 AS "Incoming",
		 "Processed: Revenues"."TargetRevenue" AS "Accrual",
		 0 AS "Outgoing",
		 0 AS "Work",
		 0 AS "WorkIntern",
		 0 AS "WorkExtern",
		 0 AS "ProjectId",
		 'Accrual' AS "ProjectName",
		 "Processed: Revenues"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 0 AS "HoursInternal",
		 0 AS "HoursExternal",
		 0 AS "HoursClient",
		 0 AS "Hours",
		 NULL AS "Name",
		 '' AS "Project Key",
		 'NULL' AS "Project Category",
		 'NULL' AS "intern/extern"
FROM  "Processed: Revenues"
LEFT JOIN "Companies" ON "Companies"."Id"  = "Processed: Revenues"."CompanyId" 
LEFT JOIN "Projects" ON "Projects"."Id"  = "Processed: Revenues"."ProjectId" 
LEFT JOIN "Config: Projekte" ON "Config: Projekte"."HQ_ProjectID"  = "Processed: Revenues"."ProjectId"  
WHERE	 "Processed: Revenues"."RevenueType"  = 'Accrual'