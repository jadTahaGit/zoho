SELECT
		plannedTime_1."Date" AS "Date",
		plannedTime_1."Project" AS "Project",
		plannedTime_1."UserName" AS "UserName"
FROM     
"Processed: PlannedTimes" AS  plannedTime_1
GROUP BY 
plannedTime_1."UserName",
plannedTime_1."Date",
plannedTime_1."Project"



-- By UN & Date
SELECT
		plannedTime_1."Date" AS "Date",
		COUNT(plannedTime_1."Project") AS "Project",
		plannedTime_1."UserName" AS "UserName",
        SUM(plannedTime_1."AmountEachDay") AS "PlannedHours/UN/date"

FROM     
"Processed: PlannedTimes" AS plannedTime_1
WHERE plannedTime_1."AmountEachDay" is not null
AND plannedTime_1."AmountEachDay" != 0
GROUP BY 
plannedTime_1."UserName",
plannedTime_1."Date"




-- By PROJECT & Date
SELECT
		plannedTime_groupedByProjectandDate."Date" AS "Date",
		plannedTime_groupedByProjectandDate."Project" AS "Project",
		COUNT(DISTINCT plannedTime_groupedByProjectandDate."UserName") AS "UserName",
        SUM(plannedTime_groupedByProjectandDate."AmountEachDay") AS "PlannedHours"

FROM     
"Processed: PlannedTimes" AS plannedTime_groupedByProjectandDate
WHERE plannedTime_groupedByProjectandDate."AmountEachDay" is not null
AND plannedTime_groupedByProjectandDate."AmountEachDay" != 0
GROUP BY 
plannedTime_groupedByProjectandDate."Project",
plannedTime_groupedByProjectandDate."Date"
 






