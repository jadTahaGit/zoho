SELECT
		 plannedTime."Date" AS "Date",
		 plannedTime."Project" AS "Project",
		 plannedTime."AmountEachDay" AS "PlannedHours",
         Mitarbeiter."hrl_rate_for_hq" * plannedTime."AmountEachDay" AS "expected Turnover",
         revenues."TargetRevenue" AS "Planned Turnover"
FROM
"Processed: PlannedTimes" AS  plannedTime
LEFT JOIN
"Config: Mitarbeiter" AS Mitarbeiter
ON  plannedTime."UserName" = Mitarbeiter."Mitarbeiter"
LEFT JOIN
"Processed: Revenues" AS revenues
ON plannedTime."Project" = revenues."ProjectName"
WHERE plannedTime."Date" < today() +183 AND plannedTime."Date" > today()-30