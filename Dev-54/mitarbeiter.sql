SELECT
		 users.Mitarbeiter,
		 users.JIRA_Cloud_UserID,
		 users.Rolle,
		 users.Unit,
		 users.Name,
		 users.Status,
		 users."Intern/Extern",
		 IFNULL(users.HQ_UserID, usersTable."ID") AS HQ_UserID,
		 users.FTE,
		 users."Contract Hours",
		 users.Level,
		 users."2022_hrl_rate_for_hq",
		 users."2021_hrl_rate_for_hq",
		 users."hrl_rate_for_hq",
		 users.Land,
		 users.EntryDate,
		 users.ExitDate,
		 users.BasicLoadInHours,
		 users.Monday,
		 users.Tuesday,
		 users.Wednesday,
		 users.Thursday,
		 users.Friday,
		 users.Saturday,
		 users.Sunday
FROM  "Config: Mitarbeiter" as users
LEFT JOIN "Users" AS usersTable 
ON users."Mitarbeiter" = usersTable."UserName" 


