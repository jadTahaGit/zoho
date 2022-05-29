SELECT
		 withPercentage.*,
		 withPercentage."Time Spent" / withPercentage."Original Estimate" AS "Progress"
FROM (	SELECT
			 CAST(plannedTime."Date" as date) AS "Date",
			 plannedTime."UserName" AS "UserName",
			 plannedTime."TaskId" AS "TaskId",
			 0 AS "Original Estimate",
			 plannedTime."AmountEachDay" AS "Time Spent",
			 plannedTime."Project" AS "Project",
			 plannedTime."Status" AS "Status"
	FROM  "Processed: PlannedTimes" AS  plannedTime 
	UNION ALL
 	SELECT
			 CAST(worklogs."Issue Due Date" as date) AS "Date",
			 worklogs."UserName" AS "UserName",
			 worklogs."Worklog Id" AS "TaskId",
			 worklogs."Issue Original Estimate" AS "Original Estimate",
			 0 AS "Time Spent",
			 worklogs."Project Name" AS "Project",
			 0 AS "Status"
	FROM  "Processed: Worklogs (Merged)" AS  worklogs 
 
) AS  withPercentage 


-- gives min empty && max 0 --> if you add them(total table) it will still give max 0 :(