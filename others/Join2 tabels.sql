-- IDEA views erstellen: --> Doesnt work beacause it`s 
-- CREATE VIEW plannedTimeNeeded AS 
-- SELECT
-- 		 plannedTime."TaskId" ,
-- 		 plannedTime."Project" AS "Project",
-- 		 plannedTime."AmountEachDay" AS "PlannedHours",
-- 		 0 AS "ActualHours"
-- FROM  "Processed: PlannedTimes" AS  plannedTime 

-- CREATE VIEW worklogsNeeded AS 
-- SELECT
-- 		 worklogs."Worklog Id" ,
-- 		 worklogs."Project Name" AS "Project",
-- 		 0 AS "PlannedHours",
-- 		 worklogs."Issue Original Estimate" AS "ActualHours"
-- FROM  "Processed: Worklogs (Merged)" AS  worklogs 
 
 


SELECT * 
FROM "Processed: PlannedTimes" AS  plannedTime JOIN "Processed: Worklogs (Merged)" AS  worklogs ON plannedTime.TaskId = worklogs."Worklog Id"


