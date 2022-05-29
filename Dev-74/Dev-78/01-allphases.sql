SELECT
		 "Date",
		 "First Name",
		 "Last Name",
		 "Companies (HubSpot CRM)"."Company Name" AS "Company Name",
		 "Processed: all phases (Contacts)"."Associated Company ID" AS "Company ID",
		 "Companies (HubSpot CRM)"."Annual Revenue" AS "Annual Revenue",
		 "Companies (HubSpot CRM)"."Website URL" AS "Website URL",
		 "Companies (HubSpot CRM)"."Number of Employees" AS "Number of Employees",
		 "Companies (HubSpot CRM)"."Industry" AS "Industry",
		 "Companies (HubSpot CRM)"."Country/Region",
		 "Companies (HubSpot CRM)"."City" AS "City",
		 "Companies (HubSpot CRM)"."Business Value" AS "Business Value",
		 "Processed: all phases (Contacts)"."Contact owner",
		 "Processed: all phases (Contacts)"."Branche",
		 "Processed: all phases (Contacts)"."Associated Deals",
		 "Processed: all phases (Contacts)"."Lifecycle Stage",
		 "Processed: all phases (Contacts)"."Lead Status",
		 "Processed: all phases (Contacts)"."Email",
		 "Processed: all phases (Contacts)"."Phone Number",
		 "Processed: all phases (Contacts)"."Original Source",
		 "Processed: all phases (Contacts)"."HubSpot Score",
		 "Processed: all phases (Contacts)"."Number of Associated Deals",
		 "Processed: all phases (Contacts)"."State/Region",
		 "Processed: all phases (Contacts)"."Total Revenue",
		 "Processed: all phases (Contacts)"."Became a Customer Date",
		 "Processed: all phases (Contacts)"."Became a Lead Date",
		 "Processed: all phases (Contacts)"."Create Date",
		 "Processed: all phases (Contacts)"."Became a Marketing Qualified Lead Date",
		 "Processed: all phases (Contacts)"."Became a Sales Qualified Lead Date",
		 "Processed: all phases (Contacts)"."Became a Subscriber Date",
		 "Processed: all phases (Contacts)"."Became an Opportunity Date",
		 "Processed: all phases (Contacts)"."Became an Evangelist Date",	
		 "Processed: all phases (Contacts)"."Close Date" AS "Close Date"
FROM  "Processed: all phases (Contacts)"
JOIN "Companies (HubSpot CRM)" ON "Processed: all phases (Contacts)"."Associated Company ID"  = "Companies (HubSpot CRM)"."Company ID"  



