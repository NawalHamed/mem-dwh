{{ config(
    materialized='table',
    schema='gold_layer'
) }}

SELECT
    contractor_id,
    contractor_name,
    contractor_classification,
    email AS contractor_email,
    phone AS contractor_phone,
    registration_number AS contractor_registration_no
FROM {{ ref('transformed_contractor') }}
