{{ config(
    materialized='table',
    schema='bronze_layer'
) }}

SELECT
    contractorid AS contractor_id, -- Primary key
    COALESCE(LOWER(contractorname), 'unknown') AS contractor_name, -- Handle nulls
    contractorclassification AS contractor_classification, -- Classification
    supplieremail AS email, -- Email
    phonenumber AS phone, -- Phone
    registrationno AS registration_number, -- Registration
    contactpersonname AS contact_name, -- Contact person
    contactpersonemailid AS contact_email, -- Contact email
    LOWER(status) AS contractor_status -- Normalize status
FROM iron_layer.qvd_vw_bi_contractor
