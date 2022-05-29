SELECT withProgress.* FROM (
    SELECT
            totaledOut.Project AS "Project",
            SUM(totaledOut."Original Estimate") AS "Original Estimate",
            SUM(totaledOut."Time Spent") AS "Time Spent"
    FROM ______ AS  totaledOut 
    GROUP BY  totaledOut.Project 
) AS withProgress











 
