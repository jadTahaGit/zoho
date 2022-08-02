SELECT
		 workingHours."Date" AS "Date",
		 workingHours."Project" AS "Project",
		 workingHours."Status" AS "Status",
		 workingHours."UserName" AS "UserName",
         unSeniority."Seniority" AS "Seniority",
		 workingHours."WorkingHours" AS "ContractHours",
		 NULL AS "PlannedHours",
         if_case(unSeniority."Seniority",'Junior', seniorityTable."Junior Hourly Rate"*workingHours."WorkingHours", 'Professional', seniorityTable."Professional Hourly Rate"*workingHours."WorkingHours", 'Senior', seniorityTable."Senior Hourly Rate"*workingHours."WorkingHours", 'Expert', seniorityTable."Expert Hourly Rate"*workingHours."WorkingHours" ) AS "expected Turnover",
         NULL AS "Planned Turnover"
FROM  
"Processed: UserDailyWorkingHours" AS  workingHours 
JOIN 
"Seniority per Username" AS unSeniority
ON workingHours."UserName" = unSeniority."UserName"
JOIN 
"Seniority - Hourly Rate" AS seniorityTable
ON workingHours."Project" = seniorityTable."Project"
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


