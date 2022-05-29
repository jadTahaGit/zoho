SELECT
		plannedTime_1."Date" AS "Date",
		plannedTime_1."Project" AS "Project",
		plannedTime_1."UserName" AS "UserName",
        plannedTime_2b."NbrOfUsernames/Project" AS "NbrOfUsernames/Project",
        plannedTime_2b."PlannedHours/Project" AS "PlannedHours/Project"
FROM     
"Processed: PlannedTimes" AS  plannedTime_1
LEFT JOIN(
      SELECT
		plannedTime_2a."Project" AS "Project",
		plannedTime_2a."Date" AS "Date",
		 COUNT(DISTINCT plannedTime_2a."UserName") AS "NbrOfUsernames/Project",
		 SUM(plannedTime_2a."AmountEachDay") AS "PlannedHours/Project"
FROM
"Processed: PlannedTimes" AS  plannedTime_2a
GROUP BY 
plannedTime_2a."Project",
plannedTime_2a."Date"
) as plannedTime_2b
ON plannedTime_1."Project" = plannedTime_2b."Project"
AND plannedTime_1."Date" = plannedTime_2b."Date"












