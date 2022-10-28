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
				 WHEN (extract(year FROM worklogs."Work Date")  = '2022') THEN worklogs."Hours" * (employee."2022_hrl_rate_for_hq" / 8)
				 WHEN (extract(year FROM worklogs."Work Date")  = '2021') THEN worklogs."Hours" * (employee."2021_hrl_rate_for_hq" / 8)
				 ELSE worklogs."Hours" * (employee."hrl_rate_for_hq" / 8)
			 END AS "Amount",
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
		 extract(year FROM worklogs."Work Date") as "Work Year",
         999999 AS "CLOUD_WORKLOGS Worklog ID Empty",
		 0 as "Jira Cloud"
FROM  "Processed: Worklogs (Merged)" AS  worklogs
LEFT JOIN "Config: Projekte" AS  projects ON worklogs."Project Key"  = projects."Projekt" 
LEFT JOIN "Config: Mitarbeiter" AS  employee ON worklogs."Username"  = employee."Mitarbeiter" 
LEFT JOIN "Projects" AS  projects2 ON projects2."Id"  = projects."HQ_ProjectID" 
LEFT JOIN "Companies" AS  companies ON companies."Id"  = projects."HQ_CompanyID"  
UNION 
 SELECT
		 COMPANIES."Name" AS "CompanyName",
		 COMPANIES."Id" AS "CompanyId",
		 PROJECTS2."Name" AS "ProjectName",
		 PROJECTS."HQ_ProjectID" AS "ProjectId",
		 PROJECTS."Account",
		 PROJECTS."Klassifizierung",
		 PROJECTS."Projektmanager",
		 PROJECTS."Kunde",
		 PROJECTS."HQ_CompanyID",
		 
			CASE
				 WHEN (extract(year FROM CLOUD_WORKLOGS."Start Time")  = '2022') THEN (CLOUD_WORKLOGS."Time Worked" / 3600) * (WORKER."2022_hrl_rate_for_hq" / 8)
				 WHEN (extract(year FROM CLOUD_WORKLOGS."Start Time")  = '2021') THEN (CLOUD_WORKLOGS."Time Worked" / 3600) * (WORKER."2021_hrl_rate_for_hq" / 8)
				 ELSE (TEMPO_WORKLOGS."TimeSpentSeconds" / 3600) * (WORKER."hrl_rate_for_hq" / 8)
			 END AS "Amount",
		 (TEMPO_WORKLOGS."TimeSpentSeconds" / 3600) AS "Hours",
		 WORKER."Name",
		 WORKER."Unit",
		 WORKER."Rolle",
		 WORKER."Intern/Extern",
		 WORKER."HQ_UserID" AS "HQ_UserID",
		 WORKER."Status",
		 CLOUD_WORKLOGS."Start Time" AS "DueDate",
		 CLOUD_PROJECTS."Project.key" AS "Project Key",
		 PROJECTS."Klassifizierung" AS "Project Category",
         		 IFNULL(CLOUD_WORKLOGS."Worklog ID",TEMPO_WORKLOGS."JiraWorklogId") AS "Worklog ID",
		 CLOUD_ISSUES."Issue Key" AS "Issue Key",
		 CLOUD_ISSUES."Summary",
		 TEMPO_WORKLOGS."Description" AS "Work Description",
		 WORKER."Mitarbeiter",
		 CLOUD_WORKLOGS."Time Worked" / 3600 AS "Hours",
		 WORKER."Mitarbeiter" AS "Staff Id",
		 CLOUD_PROJECTS."Project.key",
		 PROJECTS."Klassifizierung",
		 IFNULL(CLOUD_WORKLOGS."Start Time",TEMPO_WORKLOGS."StartDate")  AS "Work Date",
		 extract(year FROM CLOUD_WORKLOGS."Start Time") as "Work Year",
        IFNULL(CLOUD_WORKLOGS."Worklog ID",'1') AS "CLOUD_WORKLOGS Worklog ID Empty",
		 1 as "Jira Cloud"
FROM  "Software Worklogs (Jira Software Cloud)" AS  CLOUD_WORKLOGS
RIGHT JOIN "JiraCloudTempoWorklogs" AS  TEMPO_WORKLOGS ON TEMPO_WORKLOGS."JiraWorklogId"  = CLOUD_WORKLOGS."Worklog ID" 
LEFT JOIN "Software Issues (Jira Software Cloud)" AS  CLOUD_ISSUES ON CLOUD_WORKLOGS."Issue ID"  = CLOUD_ISSUES."Issue ID" 
JOIN "Config: Mitarbeiter" AS  WORKER ON WORKER."JIRA_Cloud_UserID"  = TEMPO_WORKLOGS."AuthorId" 
LEFT JOIN "Manual_Import: Software Projects (Jira Software Cloud)" AS  CLOUD_PROJECTS ON CLOUD_PROJECTS."Project.id"  = CLOUD_ISSUES."Project ID" 
LEFT JOIN "Config: Projekte" AS  PROJECTS ON PROJECTS."Projekt"  = CLOUD_PROJECTS."Project.key" 
LEFT JOIN "Projects" AS  PROJECTS2 ON PROJECTS."HQ_ProjectID"  = PROJECTS2."Id" 
LEFT JOIN "Companies" AS  COMPANIES ON COMPANIES."Id"  = PROJECTS."HQ_CompanyID"  
 
