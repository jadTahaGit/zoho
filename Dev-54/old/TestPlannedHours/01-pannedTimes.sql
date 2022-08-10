SELECT
		plannedTimes."Project" AS "Project",
		plannedTimes."Date" AS "Date",
		DISTINCT plannedTimes."UserName" AS "Team Members",
        plannedTimes."AmountEachDay" AS "PlannedHours",
        plannedTimes."AmountEachDay"
        *plannedTimes."Hourly Rate" AS "Expected Turnover"
FROM
"Processed: PlannedTimes" as plannedTimes