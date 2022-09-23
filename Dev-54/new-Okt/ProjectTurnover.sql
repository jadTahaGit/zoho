SELECT
		 revenues."CompanyName" AS "Company",
		 revenues."ProjectName" AS "Project",
		 revenues."DueDate" AS "Date",
		 0 AS "PlannedHours",
		 0 AS "Expected Turnover",
		 revenues."TargetRevenue" as "Planned Turnover"
FROM  "Processed: Revenues" AS  revenues 
UNION ALL
 SELECT
		 plannedTimes."Company" AS "Company",
		 plannedTimes."Project" AS "Project",
		 plannedTimes."Date" AS "Date",
		 plannedTimes."AmountEachDay" AS "PlannedHours",
		 (plannedTimes."AmountEachDay" * plannedTimes."Hourly Rate") AS "Expected Turnover",
		 0 as "Planned Turnover"
FROM  "Processed: PlannedTimes" AS  plannedTimes 
 

