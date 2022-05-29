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
 