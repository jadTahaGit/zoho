SELECT 
plannedTime_groupedByProjectandDate."Date",
plannedTime_groupedByProjectandDate."Project",
plannedTime_groupedByProjectandDate."PlannedHours",
plannedTime_groupedByProjectandDate."Expected Turnover"
FROM (
SELECT
			 plannedTimes."Project" AS "Project",
			 plannedTimes."Date" AS "Date",
			 SUM(DISTINCT plannedTimes."UserName") AS "Team Members",
			 SUM(plannedTimes."AmountEachDay") AS "PlannedHours",
			 SUM(plannedTimes."AmountEachDay" * plannedTimes."Hourly Rate") AS "Expected Turnover"
	FROM  "Processed: PlannedTimes" AS  plannedTimes 
	GROUP BY plannedTimes."Project",
		  plannedTimes."Date" 
) AS  plannedTime_groupedByProjectandDate 