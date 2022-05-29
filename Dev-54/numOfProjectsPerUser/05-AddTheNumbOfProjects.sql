SELECT 
plannedTime."Date" AS "Date",
plannedTime."UserName" AS "UserName",
COUNT(plannedTime."Project") AS NbrOfProjects 
FROM 
"Processed: PlannedTimes" AS plannedTime
GROUP BY plannedTime."Date", plannedTime."UserName"