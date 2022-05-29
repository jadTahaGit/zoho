-- gives min empty && max 0 --> if you add them(total table) it will still give max 0 :(
-- In this version I applied NULLIF(withoutProgress."Original Estimate", 0) to version 1
--  && Casted to double precision


SELECT
		 withPercentage.*,
		 withPercentage."Time Spent" / NULLIF(withPercentage."Original Estimate", 0) AS "Progress"
FROM (	SELECT
			 CAST(plannedTime."Date" as date) AS "Date",
			 plannedTime."UserName" AS "UserName",
			 plannedTime."TaskId" AS "TaskId",
			 0 AS "Original Estimate",
			 CAST(plannedTime."AmountEachDay" as double precision) AS "Time Spent",
			 plannedTime."Project" AS "Project",
			 plannedTime."Status" AS "Status"
	FROM  "Processed: PlannedTimes" AS  plannedTime 
	UNION ALL
 	SELECT
			 CAST(worklogs."Issue Due Date" as date) AS "Date",
			 worklogs."UserName" AS "UserName",
			 worklogs."Worklog Id" AS "TaskId",
			 CAST(worklogs."Issue Original Estimate" as double precision) AS "Original Estimate",
			 0 AS "Time Spent",
			 worklogs."Project Name" AS "Project",
			 0 AS "Status"
	FROM  "Processed: Worklogs (Merged)" AS  worklogs 
 
) AS  withPercentage 


