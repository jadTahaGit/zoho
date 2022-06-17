SELECT DISTINCT
		 companies."Name" AS "CompanyName",
		 companies."Id" AS "CompanyId",
		 projects2."Name" AS "ProjectName",
		 projects."HQ_ProjectID" AS "ProjectId",
		 projects."Account",
		 projects."Klassifizierung",
		 projects."Projektmanager",
		 projects."Kunde",
		 projects."HQ_CompanyID",
		CASE
			WHEN (extract(year from worklogs."Work Date")  = '2022') THEN worklogs."Hours" * employee."2022_hrl_rate_for_hq"
			WHEN (extract(year from worklogs."Work Date")  = '2021') THEN worklogs."Hours" * employee."2021_hrl_rate_for_hq"

			 END AS "WorkExtern",
		 worklogs."Hours" * (employee."hrl_rate_for_hq" / 8) AS "Amount",
		 worklogs."Hours" AS "Hours",
		 employee."Name",
		 employee."Unit",
		 employee."Rolle",
		 employee."Intern/Extern",
		 employee."HQ_UserID" AS "HQ_UserID",
		 employee."Status",
		 worklogs."Work Date" AS "DueDate",
		 worklogs."Project Key" AS "Project Key",
		 worklogs."Project Category" AS "Project Category",
		 worklogs."Worklog Id",
		 worklogs."Issue Key" AS "Issue Key",
		 worklogs."Issue Summary",
		 worklogs."Work Description",
		 worklogs."Username",
		 worklogs."Hours",
		 worklogs."Staff Id",
		 worklogs."Project Key",
		 worklogs."Project Category",
		 worklogs."Work Date" as "Work Date",
		 extract(year from worklogs."Work Date") as "Work Year"

FROM  "Processed: Worklogs (Merged)" AS  worklogs
LEFT JOIN "Config: Projekte" AS  projects ON worklogs."Project Key"  = projects."Projekt" 
LEFT JOIN "Config: Mitarbeiter" AS  employee ON worklogs."Username"  = employee."Mitarbeiter" 
LEFT JOIN "Projects" AS  projects2 ON projects2."Id"  = projects."HQ_ProjectID" 
LEFT JOIN "Companies" AS  companies ON companies."Id"  = projects."HQ_CompanyID"  
