SELECT
		 projects."Name" AS "Project",
		 tasks."Id" AS "TaskId",
		 workingHours."Date" AS "Date",
		 users."Name" AS "Name",
		 users."Mitarbeiter" AS "UserName",
		 users."hrl_rate_for_hq" AS "Hourly Rate",
		 users."HQ_UserId" AS "UserId",
		 users."Status" AS "Status",
		 assignments."Id" AS "AssignmentId",
		 
			CASE
				 WHEN assignments."AssignmentUnit"  = 'Hours' THEN assignments."AssignmentValue" / amountWorkingDays."AmountWorkingDays"
				 WHEN assignments."AssignmentUnit"  = 'Percent' THEN workingHours."WorkingHours" * (assignments."AssignmentValue" / 100)
				 WHEN assignments."AssignmentUnit"  = 'Days' THEN (assignments."AssignmentValue" * 8) / amountWorkingDays."AmountWorkingDays"
				 ELSE 0
			 END AS "AmountEachDay"
FROM  "Users_Assignments" AS  assignments
JOIN "ProjectTasks" AS  tasks ON assignments."TaskId"  = tasks."Id" 
JOIN "Config: Mitarbeiter" AS  users ON assignments."UserId"  = users."HQ_UserId" 
JOIN "Processed: UserDailyWorkingHours" AS  workingHours ON workingHours."Id"  = users."HQ_UserId" 
JOIN "Projects" AS  projects ON projects."Id"  = tasks."ProjectId" 
JOIN(	SELECT
			 assignments2."Id" AS "Id",
			 Count(tasks2."Id") AS "AmountWorkingDays"
	FROM  "Users_Assignments" AS  assignments2
JOIN "ProjectTasks" AS  tasks2 ON assignments2."TaskId"  = tasks2."Id" 
JOIN "Config: Mitarbeiter" AS  users2 ON assignments2."UserId"  = users2."HQ_UserId" 
JOIN "Processed: UserDailyWorkingHours" AS  workingHours2 ON workingHours2."Id"  = users2."HQ_UserId"  
	WHERE	 workingHours2."Date"  BETWEEN tasks2."StartOn"  AND  tasks2."EndOn"
	GROUP BY  assignments2."Id" 
) AS  amountWorkingDays ON amountWorkingDays."Id"  = assignments."Id"  
WHERE	 workingHours."Date"  BETWEEN tasks."StartOn"  AND  tasks."EndOn"
UNION ALL
 SELECT
		 'Grundlast' AS "Project",
		 0 AS "TaskId",
		 workingHours."Date" AS "Date",
		 users."Name" AS "Name",
		 users."Mitarbeiter" AS "UserName",
		 users."hrl_rate_for_hq" AS "Hourly Rate",
		 users."HQ_UserId" AS "UserId",
		 users."Status" AS "Status",
		 0 AS "AssignmentId",
		 users."BasicLoadInHours" AS "AmountEachDay"
FROM  "Config: Mitarbeiter" AS  users
JOIN "Processed: UserDailyWorkingHours" AS  workingHours ON users."HQ_UserId"  = workingHours."Id"  
 
