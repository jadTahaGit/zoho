SELECT
			 "Contact ID",
			 "First Name",	
			 "Last Name", 
			 "Annual Revenue",
			 "Associated Company ID",
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
			 Cast("Close Date" as date) AS Date
	FROM  "Contacts (HubSpot CRM)" 
	WHERE "Close Date" IS NOT NULL

