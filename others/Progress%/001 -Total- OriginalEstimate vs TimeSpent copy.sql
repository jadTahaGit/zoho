SELECT withProgress.* FROM (
    SELECT
            totaledOut.Project AS "Project",
            SUM(totaledOut."Original Estimate") AS "Original Estimate",
            SUM(totaledOut."Time Spent") AS "Time Spent"
    FROM (	SELECT
                plannedTime."Username" AS "UserName",
                plannedTime."TaskId" AS "TaskId",
                plannedTime."Project" AS "Project",
                0 AS "Original Estimate",
                plannedTime."AmountEachDay" AS "Time Spent"
        FROM  "Processed: PlannedTimes" AS  plannedTime 
        UNION ALL
        SELECT
                worklogs."Username" AS "UserName",
                worklogs."Worklog Id" AS "TaskId",
                worklogs."Project Name" AS "Project",
                worklogs."Issue Original Estimate" AS "Original Estimate",
                0 AS "Time Spent"
        FROM  "Processed: Worklogs (Merged)" AS  worklogs 
    
    ) AS  totaledOut 
    GROUP BY  totaledOut.Project 
) AS withProgress











 
