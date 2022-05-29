SELECT 
		 PlannedTime0."Date" AS "Date",
		 PlannedTime0."Project" AS "Project",
		 PlannedTime0."Status" AS "Status",
		 PlannedTime0."UserName" AS "UserName",
		 PlannedTime0."AmountEachDay" AS "PlannedHours",
         plannedTime1.NbrOfProjects AS NbrOfProjects
FROM 
"Processed: PlannedTimes" as PlannedTime0
INNER JOIN (
SELECT 
plannedTime2."Date" AS "Date",
plannedTime2."UserName" AS "UserName",
COUNT(plannedTime2."Project") AS NbrOfProjects 
FROM 
"Processed: PlannedTimes" AS plannedTime2
GROUP BY plannedTime2."Date", plannedTime2."UserName"
)as plannedTime1
ON plannedTime1."Date" = PlannedTime0."Date" 
AND plannedTime1."UserName" = PlannedTime0."UserName"