SELECT
		 "Processed: CUS"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 "Processed: CUS"."Date" AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: CUS" 
UNION ALL

 SELECT
		 "Processed: LEAD"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 NULL AS "Became a Customer Date",
		 "Processed: LEAD"."Date" AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: LEAD" 
UNION ALL

 SELECT
		 "Processed: MQL"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 NULL AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 "Processed: MQL"."Date" AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: MQL" 
UNION ALL

 SELECT
		 "Processed: SQL"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 NULL AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 "Processed: SQL"."Date" AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: SQL" 
UNION ALL

 SELECT
		 "Processed: SUB"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 NULL AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 "Processed: SUB"."Date" AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: SUB" 
UNION ALL

 SELECT
		 "Processed: OPP"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 NULL AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 "Processed: OPP"."Date" AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: OPP" 
UNION ALL

 SELECT
		 "Processed: EVA"."Date" AS "Date",
		 "First Name",
		 "Last Name",
		 "Annual Revenue",
		 "Primary Associated Company ID",
		 "Company Name",
		 "Country/Region",
		 "Contact owner",
		 "Branche",
		 "Associated Deals",
		 "Lifecycle Stage",
		 "Lead Status",
		 "Email",
		 "Phone Number",
		 "Website URL",
		 "Original Source",
		 "HubSpot Score",
		 "City",
		 "Number of Associated Deals",
		 "State/Region",
		 "Total Revenue",
		 NULL AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 "Processed: EVA"."Date" AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "Processed: EVA" 
UNION ALL

 SELECT
		 "DateTable"."Date" AS "Date",
		 NULL AS "First Name",
		 NULL AS "Last Name",
		 NULL AS "Annual Revenue",
		 NULL AS "Associated Company ID",
		 NULL AS "Company Name",
		 NULL AS "Country/Region",
		 NULL AS "Contact owner",
		 NULL AS "Branche",
		 NULL AS "Associated Deals",
		 NULL AS "Lifecycle Stage",
		 NULL AS "Lead Status",
		 NULL AS "Email",
		 NULL AS "Phone Number",
		 NULL AS "Website URL",
		 NULL AS "Original Source",
		 NULL AS "HubSpot Score",
		 NULL AS "City",
		 NULL AS "Number of Associated Deals",
		 NULL AS "State/Region",
		 NULL AS "Total Revenue",
		 NULL AS "Became a Customer Date",
		 NULL AS "Became a Lead Date",
		 NULL AS "Create Date",
		 NULL AS "Became a Marketing Qualified Lead Date",
		 NULL AS "Became a Sales Qualified Lead Date",
		 NULL AS "Became a Subscriber Date",
		 NULL AS "Became an Opportunity Date",
		 NULL AS "Became an Evangelist Date",
		 NULL AS "Close Date"
FROM  "DateTable" 
WHERE	 "Date"  < today()
 
 
 
 
 
 
 
