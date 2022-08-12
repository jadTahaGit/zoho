SELECT companies_company_id,
       companies_company_name,
       ELT
           (
               GREATEST(
                       MAX (FIELD (contacts_lifecycle_stage,  "lead", "marketingqualifiedlead", "salesqualifiedlead", "opportunity", "customer")),
                       MAX (FIELD (companies_lifecycle_stage,  "lead", "marketingqualifiedlead", "salesqualifiedlead", "opportunity", "customer"))
                   ),
               "lead", "marketingqualifiedlead", "salesqualifiedlead", "opportunity", "customer"
           )
           AS max_stage,
       GREATEST(COALESCE(MAX(companies_became_cus),0), COALESCE(MAX(contacts_became_cus),0) ) AS became_cus,
       GREATEST(COALESCE(MAX(companies_became_opp),0), COALESCE(MAX(contacts_became_opp),0) ) AS became_opp,
       GREATEST(COALESCE(MAX(companies_became_sql),0), COALESCE(MAX(contacts_became_sql),0) ) AS became_sql,
       GREATEST(COALESCE(MAX(companies_became_mql),0), COALESCE(MAX(contacts_became_mql),0) ) AS became_mql,
       GREATEST(COALESCE(MAX(companies_became_lead),0), COALESCE(MAX(contacts_became_lead),0) ) AS became_lead
FROM hubspot_processed
GROUP BY companies_company_id
ORDER BY companies_company_name ASC