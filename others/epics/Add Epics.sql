SELECT
		 CAST(plannedTime."Date" as date) AS "Date",
		 plannedTime."UserName" AS "UserName",
		 plannedTime."TaskId" AS "TaskId",
		 0 AS "Original Estimate",
		 plannedTime."AmountEachDay" AS "Time Spent",
		 plannedTime."Project" AS "Project",
		 plannedTime."Status" AS "Status",
		 0 AS "Version Id",
		 0 AS "Version Name",
         0 AS "Issue Summary"
FROM  "Processed: PlannedTimes" AS  plannedTime 
UNION ALL
 SELECT
		 CAST(worklogs."Issue Due Date" as date) AS "Date",
		 worklogs."UserName" AS "UserName",
		 worklogs."Worklog Id" AS "TaskId",
		 worklogs."Issue Original Estimate" AS "Original Estimate",
		 0 AS "Time Spent",
		 worklogs."Project Name" AS "Project",
		 0 AS "Status",
		 worklogs."Version Id" AS "Version Id",
		 worklogs."Version Name" AS "Version Name",
        worklogs."Issue Summary" AS "Issue Summary"
FROM  "Processed: Worklogs (Merged)" AS  worklogs 
 
