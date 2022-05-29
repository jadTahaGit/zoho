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
UNION ALL
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
-- 3.sql
UNION ALL
 SELECT
		 "IncomingInvoices"."InvoiceDate" AS "DueDate",
		 0 AS "Incoming",
		 0 AS "Accrual",
		 "IncomingInvoices"."NetTotal" * -1 AS "Outgoing",
		 0 AS "Work",
		 0 AS "WorkIntern",
		 0 AS "WorkExtern",
		 "IncomingInvoices"."ProjectId" AS "ProjectId",
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
FROM  "IncomingInvoices"
LEFT JOIN "Projects" ON "Projects"."Id"  = "IncomingInvoices"."ProjectId" 
LEFT JOIN "Companies" ON "Companies"."Id"  = "Projects"."CompanyId" 
LEFT JOIN "Config: Projekte" ON "Config: Projekte"."HQ_ProjectID"  = "Projects"."Id"  
-- 4.sql
UNION ALL
 SELECT
		 worklogs."DueDate" AS "DueDate",
		 0 AS "Incoming",
		 0 AS "Accrual",
		 0 AS "Outgoing",
		 worklogs."Amount" * -1 AS "Work",
		 
			CASE
				 WHEN (worklogs."employee.Intern/Extern"  = 'intern') THEN worklogs."Amount" * -1
				 ELSE 0.0
			 END AS "WorkIntern",
		 
			CASE
				 WHEN (worklogs."employee.Intern/Extern"  = 'extern') THEN worklogs."Amount" * -1
				 ELSE 0.0
			 END AS "WorkExtern",
		 worklogs."ProjectId" AS "ProjectId",
		 worklogs."ProjectName" AS "ProjectName",
		 worklogs."CompanyId" AS "CompanyId",
		 worklogs."CompanyName" AS "CompanyName",
		 
			CASE
				 WHEN (worklogs."employee.Intern/Extern"  = 'intern') THEN worklogs."Hours"
				 ELSE 0.0
			 END AS "HoursInternal",
		 
			CASE
				 WHEN (worklogs."employee.Intern/Extern"  = 'extern') THEN worklogs."Hours"
				 ELSE 0.0
			 END AS "HoursExternal",
		 
			CASE
				 WHEN (worklogs."employee.Intern/Extern"  = 'client') THEN worklogs."Hours"
				 ELSE 0.0
			 END AS "HoursClient",
		 worklogs."Hours" AS "Hours",
		 worklogs."employee.Name" AS "Name",
		 worklogs."Project Key" AS "Project Key",
		 worklogs."Project Category" AS "Project Category",
		 worklogs."employee.intern/extern" AS "intern/extern"
FROM  "Processed: Worklogs" AS  worklogs 
 
 
 
