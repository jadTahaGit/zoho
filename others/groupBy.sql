SELECT  
	jadAlias.Project AS "Project", 
	SUM(jadAlias."Original Estimate") AS "Original Estimate",
	SUM(jadAlias."Time Spent") AS "Time Spent"	
	FROM (
			SELECT
					plannedTime."Username" AS "UserName",
					plannedTime."TaskId" AS "TaskId",
					plannedTime."Project" AS "Project",
					0 AS "Original Estimate",
					plannedTime."AmountEachDay" AS "Time Spent"
			FROM  "Processed: PlannedTimes" AS  plannedTime 
			UNION ALL
			SELECT
					worklogs."Username" AS "UserName",
					worklogs."Worklog Id" AS "TaskId",
					worklogs."Project Name" AS "Project",
					worklogs."Issue Original Estimate" AS "Original Estimate",
					0 AS "Time Spent"
			FROM  "Processed: Worklogs (Merged)" AS  worklogs 
	) AS jadAlias
GROUP BY jadAlias.Project AS jadAlias2
UNION ALL
SELECT
	(jadAlias2."Time Spent"/jadAlias2."Original Estimate") AS "Progress"
	FROM jadAlias2



--  This works
SELECT
					CONCAT("Processed: PlannedTimes"."Username" ,
					"Processed: Worklogs (Merged)"."Username") AS "UserName",
					CONCAT("Processed: PlannedTimes"."TaskId",
					"Processed: Worklogs (Merged)"."Worklog Id") AS "TaskId",
					CONCAT("Processed: PlannedTimes"."Project" ,
					"Processed: Worklogs (Merged)"."Project Name") AS "Project",
					"Processed: PlannedTimes"."AmountEachDay" AS "Time Spent",
					"Processed: Worklogs (Merged)"."Issue Original Estimate" AS "Original Estimate"
FROM  "Processed: PlannedTimes" FULL OUTER JOIN "Processed: Worklogs (Merged)" 
ON	"Processed: PlannedTimes"."Project" = "Processed: Worklogs (Merged)"."Project Name"	

--This gives an syntax error
SELECT jadAlias22.* FROM (
SELECT
					CONCAT("Processed: PlannedTimes"."Username" ,
					"Processed: Worklogs (Merged)"."Username") AS "UserName",
					CONCAT("Processed: PlannedTimes"."TaskId",
					"Processed: Worklogs (Merged)"."Worklog Id") AS "TaskId",
					CONCAT("Processed: PlannedTimes"."Project" ,
					"Processed: Worklogs (Merged)"."Project Name") AS "Project",
					"Processed: PlannedTimes"."AmountEachDay" AS "Time Spent",
					"Processed: Worklogs (Merged)"."Issue Original Estimate" AS "Original Estimate"
FROM  "Processed: PlannedTimes" FULL OUTER JOIN "Processed: Worklogs (Merged)" 
ON	"Processed: PlannedTimes"."Project" = "Processed: Worklogs (Merged)"."Project Name"	
) AS jadAlias22

