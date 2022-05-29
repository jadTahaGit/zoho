SELECT * FROM (
SELECT withoutProgress.*, 
 withoutProgress."Time Spent"/NULLIF(withoutProgress."Original Estimate", 0) AS Progress
 FROM "OriginalEstimate_vs_TimeSpent" AS withoutProgress
)AS Jadoo
WHERE Progress IS NOT NULL;