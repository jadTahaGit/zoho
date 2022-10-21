SELECT
		 users."Name" AS "Name",
		 users."UserName" AS "UserName",
		 users."Id" AS "Id",
		 users."Date" AS "Date",
		 'contractHours' AS "Project",
		 users."Status" AS "Status",
		 users."Intern/Extern" AS "Intern/Extern",
		 absences2."OffDay" AS "OffDay",
		 absences2."Start" AS "Start",
		 
			CASE
				 WHEN absences2."OffDay"  = 1 THEN 0
				 WHEN users."UserWorkingHours"  IS NULL
				 AND	absences2."OffDay"  = 2 THEN users."ContractHours" / 10
				 WHEN users."UserWorkingHours"  IS NULL THEN users."ContractHours" / 5
				 WHEN users."UserWorkingHours"  IS NOT NULL
				 AND	absences2."OffDay"  = 2 THEN users."UserWorkingHours" / 2
				 ELSE users."UserWorkingHours"
			 END AS "WorkingHours"
FROM (	SELECT
			 users2."Name" AS "Name",
			 users2."Mitarbeiter" AS "UserName",
			 users2."HQ_UserId" AS "Id",
			 users2."EntryDate" AS "EntryDate",
			 users2."ExitDate" AS "LeavingDate",
			 users2."Status" AS "Status",
			 users2."Intern/Extern" AS "Intern/Extern",
			 users2."Contract Hours" AS "ContractHours",
			 dates2."Date" AS "Date",
			 
				CASE
					 WHEN day_of_week(dates2."Date")  = 1 THEN users2."Sunday"
					 WHEN day_of_week(dates2."Date")  = 2 THEN users2."Monday"
					 WHEN day_of_week(dates2."Date")  = 3 THEN users2."Tuesday"
					 WHEN day_of_week(dates2."Date")  = 4 THEN users2."Wednesday"
					 WHEN day_of_week(dates2."Date")  = 5 THEN users2."Thursday"
					 WHEN day_of_week(dates2."Date")  = 6 THEN users2."Friday"
					 WHEN day_of_week(dates2."Date")  = 7 THEN users2."Saturday"
					 ELSE 0
				 END AS "UserWorkingHours",
			 users2."Land" AS "Country"
	FROM  "Config: Mitarbeiter" AS  users2
CROSS JOIN "DateTable" AS  dates2 
	WHERE	 day_of_week(dates2."Date")  != 1
	 AND	day_of_week(dates2."Date")  != 7
	 AND	dates2."Date"  BETWEEN 
		CASE
			 WHEN users2."EntryDate"  IS NOT NULL THEN users2."EntryDate"
			 ELSE add_year(getdate(), -1)
		 END  AND  add_year(getdate(), 2)
) AS  users
LEFT JOIN(	SELECT
			 absences."UserId" AS UserId,
			 dates."Date" AS Date,
			 absences."Start" AS "Start",
			 
				CASE
					 WHEN dates."Date"  = absences."Start"
					 AND	datepart(HOUR, absences."Start")  = 12 THEN 2
					 WHEN dates."Date"  = absences."End"
					 AND	datepart(HOUR, absences."End")  = 12 THEN 2
					 WHEN dates."Date"  BETWEEN absences."Start"  AND  absences."End" THEN 1
					 ELSE 0
				 END AS OffDay
	FROM  "UserAbsences" AS  absences
CROSS JOIN "DateTable" AS  dates 
	WHERE	 dates."Date"  BETWEEN absences."Start"  AND  (
		CASE
			 WHEN datepart(HOUR, absences."End")  = 12 THEN absences."End"
			 ELSE add_date(absences."End", -1)
		 END)
) AS  absences2 ON absences2."UserId"  = users."Id"
	 AND	absences2."Date"  = users."Date" 
LEFT JOIN "PublicHolidays" AS  holidays ON holidays."Country"  = users."Country"
	 AND	holidays."Date"  = users."Date"  
WHERE	 holidays."Date"  IS NULL
 AND	(users."Date"  > users."EntryDate"
 OR	users."EntryDate"  IS NULL)
 AND	(users."Date"  < users."LeavingDate"
 OR	users."LeavingDate"  IS NULL)
