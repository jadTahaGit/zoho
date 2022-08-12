SELECT companies."Company ID (Companies)",
       ELT
           (
               GREATEST(
                       MAX (FIELD (companies."Lifecycle Stage (Companies)", 'lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer')),
                       MAX (FIELD (companies."Lifecycle Stage (Contacts)",  'lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer'))
                   ),
               'lead', 'marketingqualifiedlead', 'salesqualifiedlead', 'opportunity', 'customer'
           )
           AS max_stage,
        GREATEST(COALESCE(MAX(companies."Became MQL (Companies)"),0), COALESCE(MAX(companies."Became MQL (Contacts)"),0) ) AS "MQL Company"
FROM  "Processed: all phases (Contacts & Companies)" as companies
GROUP BY companies."Company ID (Companies)"




-- SELECT FIELD('q', 's', 'q', 'l');