SELECT
		 
			CASE
				 WHEN "Invoices"."Type"  != 'Cancellation' THEN "Invoices"."DeliveryDate"
				 ELSE "Invoices"."InvoiceDate"
			 END AS "DueDate",
		 "Invoices"."NetTotal" AS "Incoming",
		 0 AS "Accrual",
		 0 AS "Outgoing",
		 0 AS "Work",
		 0 AS "WorkIntern",
		 0 AS "WorkExtern",
		 "Invoices"."ProjectId" AS "ProjectId",
		 "Projects"."Name" AS "ProjectName",
		 "Projects"."CompanyId" AS "CompanyId",
		 "Companies"."Name" AS "CompanyName",
		 0 AS "HoursInternal",
		 0 AS "HoursExternal",
		 0 AS "HoursClient",
		 0 AS "Hours",
		 NULL AS "Name",
		 "Config: Projekte"."Projekt" AS "Project Key",
		 'NULL' AS "Project Category",
		 'NULL' AS "intern/extern"
FROM  "Invoices"
LEFT JOIN "Projects" ON "Projects"."Id"  = "Invoices"."ProjectId" 
LEFT JOIN "Companies" ON "Companies"."Id"  = "Projects"."CompanyId" 
LEFT JOIN "Config: Projekte" ON "Config: Projekte"."HQ_ProjectID"  = "Projects"."Id"  
WHERE	 "Invoices"."Status"  != 'Draft'