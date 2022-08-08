SELECT
        plannedTime_groupedByProjectandDate_2."Project" AS "Project",
		plannedTime_groupedByProjectandDate_2."Date" AS "Date",
		plannedTime_groupedByProjectandDate_2."UserName" AS "UserName",
        plannedTime_groupedByProjectandDate_2."PlannedHours" AS "PlannedHours",
        Mitarbeiter."hrl_rate_for_hq" AS "Hourly Rate",
        (plannedTime_groupedByProjectandDate_2."PlannedHours"*Mitarbeiter."hrl_rate_for_hq")AS "Expected Turnover",
        revenues_2."TargetRevenue" AS "Planned Turnover"
FROM     
"Config: Mitarbeiter" AS Mitarbeiter
RIGHT JOIN(
SELECT
		plannedTime_groupedByProjectandDate."Project" AS "Project",
		plannedTime_groupedByProjectandDate."Date" AS "Date",
		plannedTime_groupedByProjectandDate."UserName" AS "UserName",
        plannedTime_groupedByProjectandDate."AmountEachDay" AS "PlannedHours"
FROM     
"Processed: PlannedTimes" AS plannedTime_groupedByProjectandDate
WHERE plannedTime_groupedByProjectandDate."Date" < today() +183 AND plannedTime_groupedByProjectandDate."Date" > today()-30
) AS plannedTime_groupedByProjectandDate_2
ON  Mitarbeiter."Mitarbeiter"= plannedTime_groupedByProjectandDate_2."UserName"
JOIN(
SELECT 
    revenues.ProjectName AS "Project",
    revenues.DueDate AS "Date",
    revenues.CompanyId AS "CompanyId",
    revenues.CompanyName AS "CompanyName",
    revenues.TargetRevenue AS "TargetRevenue"
FROM
"Processed: Revenues" AS revenues
WHERE revenues.DueDate < today() +183 AND revenues.DueDate > today()-30
)AS revenues_2
ON plannedTime_groupedByProjectandDate_2."Project"= revenues_2."Project"
AND plannedTime_groupedByProjectandDate_2."Date" = revenues_2."Date"


