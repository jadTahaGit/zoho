SELECT A.Project, A.PlannedHours, A.ActualHours
FROM
(  SELECT distinct Project,
       (SELECT SUM(PlannedHours)
        FROM  "Processed: Worklogs (Merged)" AS  worklogs 
        WHERE worklogs.Project = plannedTime.Project) Total
FROM  "Processed: PlannedTimes" AS  plannedTime 
) A






SELECT
		 plannedTime."Username" AS "UserName",
		 plannedTime."Project" AS "Project",
		 plannedTime."AmountEachDay" AS "ActualHours"
FROM  "Processed: PlannedTimes" AS  plannedTime 
INTERSECT
SELECT
		 worklogs."Username" AS "UserName",
		 worklogs."Project Name" AS "Project",
		 worklogs."Issue Original Estimate" AS "PlannedHours",
FROM  "Processed: Worklogs (Merged)" AS  worklogs 








SELECT Project, Sum(AmountEachDay) AS "ActualHours" ,  SUM("Issue Original Estimate" )AS "PlannedHours"
FROM  "Processed: PlannedTimes"  JOIN "Processed: Worklogs (Merged)" ON "Processed: PlannedTimes"."Project"  = "Processed: Worklogs (Merged)"."Project Name" 
GROUP BY Project