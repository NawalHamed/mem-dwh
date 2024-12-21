{{ config(
    materialized='table',
    schema='silver_layer'
) }}

SELECT
    contractor_id,
    contractor_name,
    COALESCE(LOWER(contractor_classification), 'unknown') AS contractor_classification, -- Handle nulls
    email,
    phone,
    registration_number,
    contact_name,
    contact_email
FROM {{ ref('datasource_qvd_contractor') }}
WHERE contractor_status = 'active'
