 SELECT
		 worklogs."Work Date" AS "Date",
		 worklogs."Project Name" AS "Project",
		 worklogs."UserName" AS "UserName",
		 worklogs."User Full Name" AS "UserFullName",
		 worklogs."Issue Summary" AS "Issue Summary",
		 worklogs."Issue Status Name" AS "Status",
		 worklogs."Version Id" AS "Version Id",
		 worklogs."Version Name" AS "Version Name",
		 worklogs."Issue Original Estimate" AS "Original Estimate",
	     worklogs."Hours" AS "Time Spent"
FROM  "Processed: Worklogs (Merged)" AS  worklogs 