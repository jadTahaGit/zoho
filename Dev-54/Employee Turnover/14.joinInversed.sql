SELECT
		revenues."CompanyName" AS "Company",
		plannedTime_groupedByProjectandDate."Project" AS "Project",
		plannedTime_groupedByProjectandDate."Date" AS "Date",
		plannedTime_groupedByProjectandDate."Team Members" AS "Team Members",
        plannedTime_groupedByProjectandDate."PlannedHours" AS "PlannedHours",
        plannedTime_groupedByProjectandDate."Expected Turnover" AS "Expected Turnover",
        revenues."TargetRevenue" as "Planned Turnover"
FROM     
"Processed: Revenues" AS revenues
RIGHT JOIN(
SELECT
		plannedTimes."Project" AS "Project",
		plannedTimes."Date" AS "Date",
		SUM(DISTINCT plannedTimes."UserName") AS "Team Members",
        SUM(plannedTimes."AmountEachDay") AS "PlannedHours",
        SUM(plannedTimes."AmountEachDay"
        *plannedTimes."Hourly Rate") AS "Expected Turnover"
FROM
"Processed: PlannedTimes" as plannedTimes
GROUP BY 
plannedTimes."Project",
plannedTimes."Date"
)
AS plannedTime_groupedByProjectandDate
ON plannedTime_groupedByProjectandDate."Project"= revenues."ProjectName"
AND plannedTime_groupedByProjectandDate."Date" = revenues."DueDate"
WHERE revenues.DueDate < today() +183 AND revenues.DueDate > today()-30


