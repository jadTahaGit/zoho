SELECT
		 worklogs."DueDate" AS "Date",
		 worklogs."Name" AS "UserName",
		 worklogs."ProjectId" AS "TaskId",
		 worklogs."Hours" AS "actualTime",
		 worklogs."Amount" AS "PlannedHours",
		 worklogs."ProjectName" AS "Project",
		 worklogs."employee.Status" AS "Status"
FROM  	"Processed: Worklogs" AS  worklogs 