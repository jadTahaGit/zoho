SELECT 
targetTable."Date" AS "Date",
targetTable."Company ID (Companies)" AS "Company ID",
		 MAX(targetTable."Company Name (Companies)") AS "Company Name",
           MAX(targetTable."Number of Associated Contacts (Companies)") AS "Number of Associated Contacts",
            MAX(targetTable."Annual Revenue (Companies)") AS "Annual Revenue",
            MAX(targetTable."Website URL (Companies)") AS "Website URL",
            MAX(targetTable."Number of Employees (Companies)") AS "Number of Employees",
            MAX(targetTable."Industry (Companies)") AS "Industry (Companies)",
            MAX(targetTable."Country/Region (Companies)") AS "Country/Region",
            MAX(targetTable."State/Region (Companies)") AS "State/Region",
            MAX(targetTable."City (Companies)") AS "City (Companies)",
            MAX(targetTable."Business Value (Companies)") AS "Business Value",
            ELT
            (
               GREATEST(
                       MAX (FIELD (targetTable."Lead Status (Companies)", 'NEW','INACTIVE','BAD_TIMING','ATTEMPTED_TO_CONTACT', 'CONNECTED', 'ACTIVE','LOST','UNQUALIFIED')),
                       MAX (FIELD (targetTable."Lead Status (Contacts)",  'NEW','INACTIVE','BAD_TIMING','ATTEMPTED_TO_CONTACT', 'CONNECTED', 'ACTIVE','LOST','UNQUALIFIED'))
                   ),
               'NEW','INACTIVE','BAD_TIMING', 'ATTEMPTED_TO_CONTACT', 'CONNECTED','ACTIVE','LOST','UNQUALIFIED'
            )
           AS "Lead Status",
                ELT
           (
               GREATEST(
                       MAX (FIELD (targetTable."Lifecycle Stage (Companies)", '','evangelist','other','lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer', 'subscriber')),
                       MAX (FIELD (targetTable."Lifecycle Stage (Contacts)",  '','evangelist','other','lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer', 'subscriber'))
                   ),
               'other','other','other','lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer','subscriber'
           )
           AS "Lifecycle Stage",
            MAX(targetTable."Target Account (Companies)") AS "Target Account ",
            MAX(targetTable."ICP (Companies)") AS "ICP",
            LEAST(MAX(targetTable."Became Sub (Companies)"), 
            MAX(targetTable."Became Sub (Contacts)") ) AS "Became SUB",
            LEAST(MAX(targetTable."Became LEAD (Companies)"), 
            MAX(targetTable."Became LEAD (Contacts)") ) AS "Became LEAD",
            LEAST(MAX(targetTable."Became MQL (Companies)"), 
            MAX(targetTable."Became MQL (Contacts)") ) AS "Became MQL",
            LEAST(MAX(targetTable."Became SQL (Companies)"), 
            MAX(targetTable."Became SQL (Contacts)") ) AS "Became SQL",
            LEAST(MAX(targetTable."Became OPP (Companies)"), 
            MAX(targetTable."Became OPP (Contacts)") ) AS "Became OPP",
            LEAST(MAX(targetTable."Became CUS (Companies)"), 
            MAX(targetTable."Became CUS (Contacts)") ) AS "Became CUS",
            MAX(targetTable."Became PARTNER (Companies)") AS "Became PARTNER",
            MAX(targetTable."Became ELSE (Companies)") AS "Became ELSE",
            MAX(targetTable."Original Source Type (Companies)") AS "Original Source Type",
            MAX(targetTable."Original Source Data 1 (Companies)") AS "Original Source Data 1",
            MAX(targetTable."Original Source Data 2 (Companies)") AS "Original Source Data 2"
		
 FROM (
    SELECT
		 contacts."Date" AS "Date",
		 companies."Company ID" AS "Company ID (Companies)",
		 companies."Company Name" AS "Company Name (Companies)",
		 companies."Number of Associated Contacts" AS "Number of Associated Contacts (Companies)",
		 companies."Annual Revenue" AS "Annual Revenue (Companies)",
		 companies."Website URL" AS "Website URL (Companies)",
		 companies."Number of Employees" AS "Number of Employees (Companies)",
		 companies."Industry" AS "Industry (Companies)",
		 companies."Country/Region" AS "Country/Region (Companies)",
		 companies."State/Region" AS "State/Region (Companies)",
		 companies."City" AS "City (Companies)",
		 companies."Business Value" AS "Business Value (Companies)",
		 companies."Lead Status" AS "Lead Status (Companies)",
		 companies."Lifecycle Stage" AS "Lifecycle Stage (Companies)",
		 companies."Target Account" AS "Target Account (Companies)",
		 companies."Ideal Customer Profile Tier" AS "ICP (Companies)",
		 companies."Date entered 'Abonnent (Lifecycle Stage Pipeline)'" AS "Became SUB (Companies)",
		 companies."Date entered 'Lead (Lifecycle Stage Pipeline)'" AS "Became LEAD (Companies)",
		 companies."Date entered 'Marketing-Qualified-Lead (Lifecycle Stage Pipeline)'" AS "Became MQL (Companies)",
		 companies."Date entered 'Sales-Qualified-Lead (Lifecycle Stage Pipeline)'" AS "Became SQL (Companies)",
		 companies."Date entered 'Opportunity (Lifecycle Stage Pipeline)'" AS "Became OPP (Companies)",
		 companies."Date entered 'Kunde (Lifecycle Stage Pipeline)'" AS "Became CUS (Companies)",
		 companies."Date entered 'Partner (Lifecycle Stage Pipeline)'" AS "Became PARTNER (Companies)",
		 companies."Date entered 'Sonstiges (Lifecycle Stage Pipeline)'" AS "Became ELSE (Companies)",
		 companies."Original Source Type" AS "Original Source Type (Companies)",
		 companies."Original Source Data 1" AS "Original Source Data 1 (Companies)",
		 companies."Original Source Data 2" AS "Original Source Data 2 (Companies)",
		 contacts."Primary Associated Company ID" AS "Company ID (Contacts)",
		 contacts."Last Name" AS "Last Name (Contacts)",
		 contacts."First Name" AS "First Name (Contacts)",
		 contacts."Contact owner" AS "Contact owner (Contacts)",
		 contacts."Branche" AS "Branche (Contacts)",
		 contacts."Associated Deals" AS "Associated Deals (Contacts)",
		 contacts."Lifecycle Stage" AS "Lifecycle Stage (Contacts)",
		 contacts."Lead Status" AS "Lead Status (Contacts)",
		 contacts."Email" AS "Email (Contacts)",
		 contacts."Phone Number" AS "Phone Number (Contacts)",
		 contacts."Original Source" AS "Original Source (Contacts)",
		 contacts."HubSpot Score" AS "HubSpot Score (Contacts)",
		 contacts."Number of Associated Deals" AS "Numb of Associated Deals (Contacts)",
		 contacts."State/Region" AS "State/Region (Contacts)",
		 contacts."Total Revenue" AS "Total Revenue (Contacts)",
		 contacts."Became a Subscriber Date" AS "Became SUB (Contacts)",
		 contacts."Became a Lead Date" AS "Became LEAD (Contacts)",
		 contacts."Became a Marketing Qualified Lead Date" AS "Became MQL (Contacts)",
		 contacts."Became a Sales Qualified Lead Date" AS "Became SQL (Contacts)",
		 contacts."Became an Opportunity Date" AS "Became OPP (Contacts)",
		 contacts."Became a Customer Date" AS "Became CUS (Contacts)",
		 contacts."Became an Evangelist Date" AS "Became EVA (Contacts)"
FROM  "Processed: all phases (Contacts)" AS contacts
JOIN "Companies (HubSpot CRM)" AS companies
ON contacts."Primary Associated Company ID"  = companies."Company ID"  
) as targetTable
GROUP BY targetTable."Date" , targetTable."Company ID (Companies)"
