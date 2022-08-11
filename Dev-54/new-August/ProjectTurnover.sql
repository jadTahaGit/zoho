SELECT
		--  plannedTime_groupedByProjectandDate."Company" AS "Company",
		--  plannedTime_groupedByProjectandDate."Project" AS "Project",
		 DateTable."Date" AS "Date",
		--  plannedTime_groupedByProjectandDate."Team Members" AS "Team Members",
		--  plannedTime_groupedByProjectandDate."PlannedHours" AS "PlannedHours",
		--  plannedTime_groupedByProjectandDate."Expected Turnover" AS "Expected Turnover",
		 revenues."TargetRevenue" as "Planned Turnover"
FROM  "Processed: Revenues" AS  revenues
JOIN "DateTable" as DateTable ON DateTable."Date" = revenues."DueDate"

SELECT
		 revenues."CompanyName" AS "Company",
		 revenues."ProjectName" AS "Project",
		 DateTable."Date" AS "Date",
		--  plannedTime_groupedByProjectandDate."Team Members" AS "Team Members",
		--  plannedTime_groupedByProjectandDate."PlannedHours" AS "PlannedHours",
		--  plannedTime_groupedByProjectandDate."Expected Turnover" AS "Expected Turnover",
		 revenues."TargetRevenue" as "Planned Turnover"
FROM  "Processed: Revenues" AS  revenues
JOIN "DateTable" as DateTable ON DateTable."Date" = revenues."DueDate"



SELECT
		MAX(revenues."CompanyName") AS "Company",
		revenues."ProjectName" AS "Project",
	    MAX(DateTable."Date") AS "Date",
		SUM(plannedTimes."AmountEachDay") AS "PlannedHours",
		SUM(plannedTimes."AmountEachDay" * plannedTimes."Hourly Rate") AS "Expected Turnover",
		SUM(revenues."TargetRevenue") AS "Planned Turnover"
FROM  "Processed: Revenues" AS  revenues

FULL OUTER JOIN "DateTable" AS DateTable ON DateTable."Date" = revenues."DueDate"
--  AND DateTable."Date" = plannedTimes."Date"

-- FULL OUTER JOIN "Projects" AS Projects ON Projects."Id" = revenues."ProjectId" AND Projects."Name" = revenues."ProjectName" AND Projects."CompanyId" = revenues."CompanyId" AND Projects."CompanyName" = revenues."CompanyName"

JOIN "Processed: PlannedTimes" AS plannedTimes ON plannedTimes."ProjectId" = revenues."ProjectId"

WHERE	 DateTable."Date"  < today() + 183
AND	DateTable."Date"  > today() - 30

GROUP BY 
revenues."ProjectName"



FULL OUTER JOIN(	SELECT
			 plannedTimes."Company" AS "Company",
			 plannedTimes."Project" AS "Project",
			 plannedTimes."Date" AS "Date",
			 COUNT(DISTINCT plannedTimes."UserName") AS "Team Members",
			 SUM(plannedTimes."AmountEachDay") AS "PlannedHours",
			 SUM(plannedTimes."AmountEachDay" * plannedTimes."Hourly Rate") AS "Expected Turnover"
	FROM  "Processed: PlannedTimes" AS  plannedTimes 
	GROUP BY plannedTimes."Project",
		  plannedTimes."Date",
		  plannedTimes."Company"
) AS  plannedTime_groupedByProjectandDate ON plannedTime_groupedByProjectandDate."Project"  = revenues."ProjectName"
WHERE	 plannedTime_groupedByProjectandDate."Date"  < today() + 183
AND	plannedTime_groupedByProjectandDate."Date"  > today() - 30
