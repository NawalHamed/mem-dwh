{{ config(
    materialized='table',
    schema='silver_layer'
) }}

SELECT
    contractor_id, -- No change here, matches Bronze
    contractor_name,
    LOWER(contractor_classification) AS contractor_classification, -- Normalize classification
    email,
    phone,
    registration_number,
    contact_name,
    contact_email
FROM {{ ref('datasource_qvd_contractor') }}
WHERE contractor_status = 'active' -- No need to normalize again
