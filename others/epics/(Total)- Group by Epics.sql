-- Group by 2 columns Project & "Issue Summary"

SELECT
		 alreadyGrouped.Project AS "Project",
         alreadyGrouped."Issue Summary" AS "Epic",
		 SUM(alreadyGrouped."Original Estimate")  AS "Original Estimate",
		 SUM(alreadyGrouped."Time Spent") AS "Time Spent"
FROM (	SELECT
			 plannedTime."Username" AS "UserName",
			 plannedTime."TaskId" AS "TaskId",
			 plannedTime."Project" AS "Project",
			 0 AS "Original Estimate",
			 plannedTime."AmountEachDay" AS "Time Spent",
             0 AS "Issue Summary"
	FROM  "Processed: PlannedTimes" AS  plannedTime 
	UNION ALL
 	SELECT
			 worklogs."Username" AS "UserName",
			 worklogs."Worklog Id" AS "TaskId",
			 worklogs."Project Name" AS "Project",
			 worklogs."Issue Original Estimate" AS "Original Estimate",
			 0 AS "Time Spent",
             worklogs."Issue Summary" AS "Issue Summary"
	FROM  "Processed: Worklogs (Merged)" AS  worklogs 
) AS  alreadyGrouped 
GROUP BY  alreadyGrouped.Project, alreadyGrouped."Issue Summary"




-- OriginalEstimate <switch> TimeSpent

SELECT
		 alreadyGrouped.Project AS "Project",
         alreadyGrouped."Issue Summary" AS "Epic",
		 SUM(alreadyGrouped."Original Estimate")  AS "Original Estimate",
		 SUM(alreadyGrouped."Time Spent") AS "Time Spent"
FROM (	SELECT
			 plannedTime."Username" AS "UserName",
			 plannedTime."TaskId" AS "TaskId",
			 plannedTime."Project" AS "Project",
			 plannedTime."AmountEachDay" AS "Original Estimate",
			 0 AS "Time Spent",
             0 AS "Issue Summary"
	FROM  "Processed: PlannedTimes" AS  plannedTime 
	UNION ALL
 	SELECT
			 worklogs."Username" AS "UserName",
			 worklogs."Worklog Id" AS "TaskId",
			 worklogs."Project Name" AS "Project",
			 0 AS "Original Estimate",
			 worklogs."Issue Original Estimate" AS "Time Spent",
             worklogs."Issue Summary" AS "Issue Summary"
	FROM  "Processed: Worklogs (Merged)" AS  worklogs 
) AS  alreadyGrouped 
GROUP BY  alreadyGrouped.Project, alreadyGrouped."Issue Summary"
