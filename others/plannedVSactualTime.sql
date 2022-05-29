SELECT
		 plannedTime."Username" AS "UserName",
		 plannedTime."TaskId" AS "TaskId",
		 plannedTime."Project" AS "Project",
		 0 AS "PlannedHours",
		 plannedTime."AmountEachDay" AS "ActualHours"
FROM  "Processed: PlannedTimes" AS  plannedTime 
UNION ALL
 SELECT
		 worklogs."Username" AS "UserName",
		 worklogs."Worklog Id" AS "TaskId",
		 worklogs."Project Name" AS "Project",
		 worklogs."Issue Original Estimate" AS "PlannedHours",
		 0 AS "ActualHours"
FROM  "Processed: Worklogs (Merged)" AS  worklogs 



-- #####################  with more details:

SELECT
		 plannedTime."Date" AS "Date",
		 plannedTime."UserName" AS "UserName",
		 plannedTime."TaskId" AS "TaskId",
		 0 AS "Original Estimate",
		 plannedTime."AmountEachDay" AS "Time Spent",
		 plannedTime."Project" AS "Project",
		 plannedTime."Status" AS "Status"
FROM  "Processed: PlannedTimes" AS  plannedTime 
UNION ALL
 SELECT
		 worklogs."Issue Due Date" AS "Date",
		 worklogs."UserName" AS "UserName",
		 worklogs."Worklog Id" AS "TaskId",
		 worklogs."Issue Original Estimate" AS "Original Estimate",
		 0 AS "Time Spent",
		 worklogs."Project Name" AS "Project",
		 0 AS "Status"
FROM  "Processed: Worklogs (Merged)" AS  worklogs 
 

