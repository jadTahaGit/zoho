SELECT targetTable."Company ID (Companies)" AS "Company ID (Companies)",
		 MAX(targetTable."Company Name (Companies)") AS "Company Name (Companies)",
           MAX(targetTable."Number of Associated Contacts (Companies)") AS "Number of Associated Contacts (Companies)",
            MAX(targetTable."Annual Revenue (Companies)") AS "Annual Revenue (Companies)",
            MAX(targetTable."Website URL (Companies)") AS "Website URL (Companies)",
            MAX(targetTable."Number of Employees (Companies)") AS "Number of Employees (Companies)",
            MAX(targetTable."Industry (Companies)") AS "Industry (Companies)",
            MAX(targetTable."Country/Region (Companies)") AS "Country/Region (Companies)",
            MAX(targetTable."State/Region (Companies)") AS "State/Region (Companies)",
            MAX(targetTable."City (Companies)") AS "City (Companies)",
            MAX(targetTable."Business Value (Companies)") AS "Business Value (Companies)",
            MAX(targetTable."Lead Status (Companies)") AS "Lead Status (Companies)",
            ELT
            (
               GREATEST(
                       MAX (FIELD (targetTable."Lead Status (Companies)", '','INACTIVE','ACTIVE','UNQUALIFIED')),
                       MAX (FIELD (targetTable."Lead Status (Contacts)",  '','INACTIVE','ACTIVE','UNQUALIFIED'))
                   ),
               'UNDEFINED','INACTIVE','ACTIVE','UNQUALIFIED'
            )
           AS max_Status,
            MAX(targetTable."Lead Status (Contacts)") AS "Lead Status (Contacts)",
            MAX(targetTable."Lifecycle Stage (Companies)") AS "Lifecycle Stage (Companies)",
                ELT
           (
               GREATEST(
                       MAX (FIELD (targetTable."Lifecycle Stage (Companies)", '','evangelist','other','lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer', 'subscriber')),
                       MAX (FIELD (targetTable."Lifecycle Stage (Contacts)",  '','evangelist','other','lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer', 'subscriber'))
                   ),
               'other','other','other','lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer','subscriber'
           )
           AS max_stage,
            MAX(targetTable."Lifecycle Stage (Contacts)") AS "Lifecycle Stage (Contacts)",
            MAX(targetTable."Target Account (Companies)") AS "Target Account (Companies)",
            MAX(targetTable."ICP (Companies)") AS "ICP (Companies)",
            MAX(targetTable."Became SUB (Companies)") AS "Became SUB (Companies)",
            LEAST(MAX(targetTable."Became Sub (Companies)"), 
            MAX(targetTable."Became Sub (Contacts)") ) AS "Min SUB Company",

            MAX(targetTable."Became LEAD (Companies)") AS "Became LEAD (Companies)",
            LEAST(MAX(targetTable."Became LEAD (Companies)"), 
            MAX(targetTable."Became LEAD (Contacts)") ) AS "MIN_LEAD",
            MAX(targetTable."Became LEAD (Contacts)") AS "Became LEAD (Contacts)",

            MAX(targetTable."Became MQL (Companies)") AS "Became MQL (Companies)",
            LEAST(MAX(targetTable."Became MQL (Companies)"), 
            MAX(targetTable."Became MQL (Contacts)") ) AS "MIN_MQL Company",
            MAX(targetTable."Became MQL (Contacts)") AS "Became MQL (Contacts)",
            MAX(targetTable."Became SQL (Companies)") AS "Became SQL (Companies)",
            LEAST(MAX(targetTable."Became SQL (Companies)"), 
            MAX(targetTable."Became SQL (Contacts)") ) AS "MIN_SQL Company",
            MAX(targetTable."Became SQL (Contacts)") AS "Became SQL (Contacts)",
            MAX(targetTable."Became OPP (Companies)") AS "Became OPP (Companies)",
            LEAST(MAX(targetTable."Became OPP (Companies)"), 
            MAX(targetTable."Became OPP (Contacts)") ) AS "MIN_OPP Company",
            MAX(targetTable."Became OPP (Contacts)") AS "Became OPP (Contacts)",
            MAX(targetTable."Became CUS (Companies)") AS "Became CUS (Companies)",
            LEAST(MAX(targetTable."Became CUS (Companies)"), 
            MAX(targetTable."Became CUS (Contacts)") ) AS "MIN_CUS Company",
            MAX(targetTable."Became CUS (Contacts)") AS "Became CUS (Contacts)",
            MAX(targetTable."Became PARTNER (Companies)") AS "Became PARTNER (Companies)",
            MAX(targetTable."Became ELSE (Companies)") AS "Became ELSE (Companies)",
            MAX(targetTable."Original Source Type (Companies)") AS "Original Source Type (Companies)",
            MAX(targetTable."Original Source Data 1 (Companies)") AS "Original Source Data 1 (Companies)",
            MAX(targetTable."Original Source Data 2 (Companies)") AS "Original Source Data 2 (Companies)"
		
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
GROUP BY targetTable."Company ID (Companies)"
