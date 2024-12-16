{{ config(
    materialized='table',
    schema='bronze_layer'
) }}

SELECT
    contractorid AS contractor_id, -- Primary key
    LOWER(contractorname) AS contractor_name, -- Normalize names to lowercase
    contractorclassification AS contractor_classification, -- Classification
    supplieremail AS email, -- Contractor email
    phonenumber AS phone, -- Contractor phone
    registrationno AS registration_number, -- Registration number
    contactpersonname AS contact_name, -- Contact person name
    contactpersonemailid AS contact_email, -- Contact person email
    LOWER(status) AS contractor_status -- Normalize status to lowercase
FROM iron_layer.qvd_vw_bi_contractor
WHERE LOWER(status) = 'active' -- Include only active contractors
