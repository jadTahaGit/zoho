SELECT
		 workingHours."Date" AS "Date",
		 'contractHours' AS "Project",
		 workingHours."Status" AS "Status",
		 workingHours."UserName" AS "UserName",
         unSeniority."Seniority" AS "Seniority",
		 workingHours."WorkingHours" AS "ContractHours",
		 NULL AS "PlannedHours",
         seniorityTable."Junior Hourly Rate" AS "Junior Hourly Rate",
         seniorityTable."Professional Hourly Rate" AS "Professional Hourly Rate",
         seniorityTable."Senior Hourly Rate" AS "Senior Hourly Rate",
         seniorityTable."Expert Hourly Rate" AS "Expert Hourly Rate",
         if_case(unSeniority."Seniority",'Junior', seniorityTable."Junior Hourly Rate"*workingHours."WorkingHours", 'Professional', seniorityTable."Professional Hourly Rate"*workingHours."WorkingHours", 'Senior', seniorityTable."Senior Hourly Rate"*workingHours."WorkingHours", 'Expert', seniorityTable."Expert Hourly Rate"*workingHours."WorkingHours" ) AS "expected Turnover",
         NULL AS "Planned Turnover"
FROM  "Processed: UserDailyWorkingHours" AS  workingHours , "Seniority - Hourly Rate" AS seniorityTable, "Seniority per Username" as unSeniority
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
         seniorityTable."Junior Hourly Rate" AS "Junior Hourly Rate",
         seniorityTable."Professional Hourly Rate" AS "Professional Hourly Rate",
         seniorityTable."Senior Hourly Rate" AS "Senior Hourly Rate",
         seniorityTable."Expert Hourly Rate" AS "Expert Hourly Rate",
         NULL AS "expected Turnover",
         if_case(unSeniority."Seniority",'Junior', seniorityTable."Junior Hourly Rate"*plannedTime."AmountEachDay", 'Professional', seniorityTable."Professional Hourly Rate"*plannedTime."AmountEachDay", 'Senior', seniorityTable."Senior Hourly Rate"*plannedTime."AmountEachDay", 'Expert', seniorityTable."Expert Hourly Rate"*plannedTime."AmountEachDay" ) 
         AS "Planned Turnover"
FROM  "Processed: PlannedTimes" AS  plannedTime ,
"Seniority - Hourly Rate" AS seniorityTable,
"Seniority per Username" as unSeniority
WHERE plannedTime."Date" < today() +183 