SELECT
		 workingHours."Date" AS "Date",
		 IF(workingHours."Project" = 'contractHours', plannedTime."Project", NULL) AS "Project",
		 workingHours."Status" AS "Status",
		 workingHours."UserName" AS "UserName",
         unSeniority."Seniority" AS "Seniority",
		 workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects" AS "ContractHours",
		 NULL AS "PlannedHours",
         if_case(unSeniority."Seniority",'Junior', seniorityTable."Junior Hourly Rate"*workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects", 'Professional', seniorityTable."Professional Hourly Rate"*workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects", 'Senior', seniorityTable."Senior Hourly Rate"*workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects", 'Expert', seniorityTable."Expert Hourly Rate"*workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects" ) AS "expected Turnover",
         NULL AS "Planned Turnover"
FROM  
"Processed: UserDailyWorkingHours" AS  workingHours 
JOIN 
"Seniority per Username" AS unSeniority
ON workingHours."UserName" = unSeniority."UserName"
JOIN 
"Processed: PlannedTimes" AS plannedTime
ON workingHours."UserName" = plannedTime."UserName" 
AND workingHours."Date" = plannedTime."Date"
JOIN 
"Seniority - Hourly Rate" AS seniorityTable
ON workingHours."Project" = seniorityTable."Project"
JOIN
"numOfProjectsPerUser" AS numOfProjectsPerUser
ON workingHours."UserName" = numOfProjectsPerUser."UserName" 
AND workingHours."Date" = numOfProjectsPerUser."Date"
WHERE workingHours."Date" < today() +183 AND workingHours."Date" > today()-30
UNION ALL
SELECT
		 plannedTime."Date" AS "Date",
		 plannedTime."Project" AS "Project",
		 plannedTime."Status" AS "Status",
		 plannedTime."UserName" AS "UserName",
         unSeniority."Seniority" AS "Seniority",
		 NULL AS "ContractHours",
		 plannedTime."AmountEachDay" AS "PlannedHours",
         NULL AS "expected Turnover",
         if_case(unSeniority."Seniority",'Junior', seniorityTable."Junior Hourly Rate"*plannedTime."AmountEachDay", 'Professional', seniorityTable."Professional Hourly Rate"*plannedTime."AmountEachDay", 'Senior', seniorityTable."Senior Hourly Rate"*plannedTime."AmountEachDay", 'Expert', seniorityTable."Expert Hourly Rate"*plannedTime."AmountEachDay" ) 
         AS "Planned Turnover"
FROM  "Processed: PlannedTimes" AS  plannedTime
JOIN
"Seniority per Username" AS unSeniority
ON  plannedTime."UserName" = unSeniority."UserName"
JOIN
"Seniority - Hourly Rate" AS seniorityTable
ON plannedTime."Project" = seniorityTable."Project"
WHERE plannedTime."Date" < today() +183 AND plannedTime."Date" > today()-30

