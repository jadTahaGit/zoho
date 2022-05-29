SELECT  "Project"  FROM (
		SELECT
				plannedTime."Project" AS "Project",
				plannedTime."AmountEachDay" AS "PlannedHours",
				0 AS "ActualHours"
		FROM  "Processed: PlannedTimes" AS  plannedTime
        GROUP BY "Project"
) AS "Actual_vs_Planned"




-- SELECT * FROM (SELECT uid, COUNT(*) AS count FROM my_table GROUP BY 1 ORDER BY 2) AS x LIMIT 1;


-- "Project", SUM("PlannedHours") AS "AllPlannedHours" 
			
            	-- plannedTime."Username" AS "UserName",
				-- plannedTime."TaskId" AS "TaskId",