SELECT
		 "Date",
		 "Companies (HubSpot CRM)"."Company ID" AS "Company ID (Companies)",
		 "Companies (HubSpot CRM)"."Company Name" AS "Company Name (Companies)",
		 "Companies (HubSpot CRM)"."Number of Associated Contacts" AS "Number of Associated Contacts (Companies)",
		 "Companies (HubSpot CRM)"."Lead Status" AS "Lead Status (Companies)",
		 "Companies (HubSpot CRM)"."Lifecycle Stage" AS "Lifecycle Stage (Companies)",
		 "Companies (HubSpot CRM)"."Date entered 'Abonnent (Lifecycle Stage Pipeline)'" AS "Became SUB (Companies)",
		 "Companies (HubSpot CRM)"."Date entered 'Lead (Lifecycle Stage Pipeline)'" AS "Became LEAD (Companies)",
		 "Companies (HubSpot CRM)"."Date entered 'Marketing-Qualified-Lead (Lifecycle Stage Pipeline)'" AS "Became MQL (Companies)",
		 "Companies (HubSpot CRM)"."Date entered 'Sales-Qualified-Lead (Lifecycle Stage Pipeline)'" AS "Became SQL (Companies)",
		 "Processed: all phases (Contacts)"."Primary Associated Company ID" AS "Company ID (Contacts)",
		 "Processed: all phases (Contacts)"."Last Name" AS "Last Name (Contacts)",
		 "Processed: all phases (Contacts)"."Lifecycle Stage" AS "Lifecycle Stage (Contacts)",
		 "Processed: all phases (Contacts)"."Lead Status" AS "Lead Status (Contacts)",
		 "Processed: all phases (Contacts)"."Email" AS "Email (Contacts)",
		 "Processed: all phases (Contacts)"."Phone Number" AS "Phone Number (Contacts)",
		 "Processed: all phases (Contacts)"."Original Source" AS "Original Source (Contacts)",
		 "Processed: all phases (Contacts)"."HubSpot Score" AS "HubSpot Score (Contacts)",
		 "Processed: all phases (Contacts)"."Number of Associated Deals" AS "Numb of Associated Deals (Contacts)",
		 "Processed: all phases (Contacts)"."State/Region" AS "State/Region (Contacts)",
		 "Processed: all phases (Contacts)"."Total Revenue" AS "Total Revenue (Contacts)",
		 "Processed: all phases (Contacts)"."Became a Subscriber Date" AS "Became SUB (Contacts)",
		 "Processed: all phases (Contacts)"."Became a Lead Date" AS "Became LEAD (Contacts)",
		 "Processed: all phases (Contacts)"."Became a Marketing Qualified Lead Date" AS "Became MQL (Contacts)",
		 "Processed: all phases (Contacts)"."Became a Sales Qualified Lead Date" AS "Became SQL (Contacts)",
		 "Processed: all phases (Contacts)"."Became an Opportunity Date" AS "Became OPP (Contacts)",
		 "Processed: all phases (Contacts)"."Became a Customer Date" AS "Became CUS (Contacts)",
		 "Processed: all phases (Contacts)"."Became an Evangelist Date" AS "Became EVA (Contacts)"
FROM  "Processed: all phases (Contacts)"
JOIN "Companies (HubSpot CRM)" ON "Processed: all phases (Contacts)"."Primary Associated Company ID"  = "Companies (HubSpot CRM)"."Company ID"  