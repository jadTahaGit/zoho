SELECT
		 plannedTime."Date" AS "Date",
		 plannedTime."UserName" AS "UserName",
		 plannedTime."Name" AS "Name",
		 plannedTime."TaskId" AS "TaskId",
		 0 AS "ContractHours",
		 plannedTime."AmountEachDay" AS "PlannedHours",
		 plannedTime."Project" AS "Project",
		 plannedTime."Status" AS "Status"
FROM  "Processed: PlannedTimes" AS  plannedTime 
UNION ALL
 SELECT
		 workingHours."Date" AS "Date",
		 workingHours."UserName" AS "UserName",
		 workingHours."Name" AS "Name",
		 0 AS "TaskId",
		 workingHours."WorkingHours" AS "ContractHours",
		 0 AS "PlannedHours",
		 'WorkingHours' AS "Project",
		 workingHours."Status" AS "Status"
FROM  "Processed: UserDailyWorkingHours" AS  workingHours 
 
