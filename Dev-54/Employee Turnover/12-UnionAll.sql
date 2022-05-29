SELECT
		plannedTime_groupedByProjectandDate."Project" AS "Project",
		plannedTime_groupedByProjectandDate."Date" AS "Date",
		plannedTime_groupedByProjectandDate."UserName" AS "UserName",
        SUM(plannedTime_groupedByProjectandDate."AmountEachDay") AS "PlannedHours",
        NULL AS "Hourly Rate",
        NULL AS "CompanyId",
        NULL AS "CompanyName",
        NULL AS "TargetRevenue"
FROM     
"Processed: PlannedTimes" AS plannedTime_groupedByProjectandDate
WHERE plannedTime_groupedByProjectandDate."Date" < today() +183 AND plannedTime_groupedByProjectandDate."Date" > today()-30
GROUP BY 
plannedTime_groupedByProjectandDate."UserName",
plannedTime_groupedByProjectandDate."Date",
plannedTime_groupedByProjectandDate."Project"

UNION ALL

SELECT
		NULL AS "Project",
		NULL AS "Date",
		Mitarbeiter."Mitarbeiter" AS "UserName",
        Mitarbeiter."hrl_rate_for_hq" AS "Hourly Rate",
        NULL AS "PlannedHours",
        NULL AS "CompanyId",
        NULL AS "CompanyName",
        NULL AS "TargetRevenue"
FROM     
"Config: Mitarbeiter" AS Mitarbeiter

UNION ALL

SELECT 
	    revenues.ProjectName AS "Project",
        revenues.DueDate AS "Date",
		NULL AS "UserName",
        NULL AS "PlannedHours",
        NULL AS "Hourly Rate",
       revenues.CompanyId AS "CompanyId",
       revenues.CompanyName AS "CompanyName",
       revenues.TargetRevenue AS "TargetRevenue"
FROM
"Processed: Revenues" AS revenues
WHERE revenues.DueDate < today() +183 AND revenues.DueDate > today()-30



 