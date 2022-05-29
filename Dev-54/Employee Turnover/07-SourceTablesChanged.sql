SELECT
		 workingHours."Date" AS "Date",
		 IF(workingHours."Project" = 'contractHours', plannedTime."Project", NULL) AS "Project",
		 workingHours."Status" AS "Status",
		 workingHours."UserName" AS "UserName",
		 workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects" AS "ContractHours",
		 NULL AS "PlannedHours",
         Mitarbeiter."hrl_rate_for_hq" * (workingHours."WorkingHours"/numOfProjectsPerUser."NbrOfProjects") AS "expected Turnover",
         NULL AS "Planned Turnover"
FROM  
"Processed: UserDailyWorkingHours" AS  workingHours 
JOIN 
"Config: Mitarbeiter" AS Mitarbeiter
ON workingHours."UserName" = Mitarbeiter."Mitarbeiter" 
JOIN 
"Processed: PlannedTimes" AS plannedTime
ON workingHours."UserName" = plannedTime."UserName" 
AND workingHours."Date" = plannedTime."Date"
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
         Mitarbeiter."Seniority" AS "Seniority",
		 NULL AS "ContractHours",
		 plannedTime."AmountEachDay" AS "PlannedHours",
         NULL AS "expected Turnover",
         if_case(Mitarbeiter."Seniority",'Junior', seniorityTable."Junior Hourly Rate"*plannedTime."AmountEachDay", 'Professional', seniorityTable."Professional Hourly Rate"*plannedTime."AmountEachDay", 'Senior', seniorityTable."Senior Hourly Rate"*plannedTime."AmountEachDay", 'Expert', seniorityTable."Expert Hourly Rate"*plannedTime."AmountEachDay" ) 
         AS "Planned Turnover"
FROM  "Processed: PlannedTimes" AS  plannedTime
JOIN
"Config: Mitarbeiter" AS Mitarbeiter
ON  plannedTime."UserName" = Mitarbeiter."UserName"
JOIN
"Seniority - Hourly Rate" AS seniorityTable
ON plannedTime."Project" = seniorityTable."Project"
WHERE plannedTime."Date" < today() +183 AND plannedTime."Date" > today()-30

