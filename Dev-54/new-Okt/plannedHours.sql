 SELECT
		 plannedTimes."Company" AS "Company",
		 plannedTimes."Project" AS "Project",
		 plannedTimes."Date" AS "Date",
		 SUM(plannedTimes."AmountEachDay") AS "PlannedHours",
		 SUM(plannedTimes."AmountEachDay" * plannedTimes."Hourly Rate") AS "Expected Turnover",
		 0 as "Planned Turnover"
FROM  "Processed: PlannedTimes" AS  plannedTimes 
GROUP BY plannedTimes."Date", plannedTimes."Company", plannedTimes."Project"




