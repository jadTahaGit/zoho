CREATE TABLE "OriginalEstimate_vs_TimeSpent" (
 Date DATE,
 UserName VARCHAR(50),
 TaskId int,
 "Original Estimate" DOUBLE,
 "Time Spent" DOUBLE,
 Project VARCHAR(250),
 Status VARCHAR(50)

);

ALTER TABLE "OriginalEstimate_vs_TimeSpent" 
ALTER COLUMN "Original Estimate" TYPE double precision,
ALTER COLUMN "Time Spent" TYPE double precision;



COPY "OriginalEstimate_vs_TimeSpent"(Date, UserName, TaskId, "Original Estimate", "Time Spent", Project, Status) FROM '/Users/jadtaha/Desktop/OriginalEstimate_vs_TimeSpent.csv' DELIMITER ',' CSV HEADER;

-- chmod a+rX /users/jadtaha/ /users/jadtaha/desktop /users/jadtaha/desktop/OriginalEstimate_vs_TimeSpent.csv

-- Permision from preferences -> Security



 SELECT * FROM "OriginalEstimate_vs_TimeSpent";
