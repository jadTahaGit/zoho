SELECT
(TEMPO_WORKLOGS."TimeSpentSeconds" / 3600) AS "Hours",
         CLOUD_WORKLOGS."Start Time" AS "DueDate",
		 IFNULL(CLOUD_WORKLOGS."Worklog ID",TEMPO_WORKLOGS."JiraWorklogId") AS "Worklog ID",
		 CLOUD_WORKLOGS."Time Worked" / 3600 AS "Time Worked(Hours)",
		 CLOUD_WORKLOGS."Start Time" AS "Work Date",
         -- other columns
          CLOUD_ISSUES."Issue Key" AS "Issue Key",
		 CLOUD_ISSUES."Summary",
         -- other columns
		 extract(year FROM CLOUD_WORKLOGS."Start Time") as "Work Year",
          IFNULL(CLOUD_WORKLOGS."Worklog ID",'1') AS "CLOUD_WORKLOGS Worklog ID Empty"
FROM  "Software Worklogs (Jira Software Cloud)" AS  CLOUD_WORKLOGS
RIGHT JOIN "JiraCloudTempoWorklogs" AS  TEMPO_WORKLOGS ON TEMPO_WORKLOGS."JiraWorklogId"  = CLOUD_WORKLOGS."Worklog ID" 
LEFT JOIN "Software Issues (Jira Software Cloud)" AS  CLOUD_ISSUES ON CLOUD_WORKLOGS."Issue ID"  = CLOUD_ISSUES."Issue ID" 