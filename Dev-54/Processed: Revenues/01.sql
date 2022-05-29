SELECT  
       revenues.CompanyId AS "CompanyId",
       revenues.CompanyName AS "CompanyName",
       revenues.TargetRevenue AS "TargetRevenue",
       revenues.DueDate AS "DueDate",
       revenues.ProjectName AS "Project"
FROM
"Processed: Revenues" AS revenues
