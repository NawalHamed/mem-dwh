{{ config(
    materialized='table',
    schema='silver_layer'
) }}

SELECT
    contract_id,
    contract_title,
    contract_value,
    start_date,
    end_date,
    awarded_flag,
    contractor_id, -- Matches transformed_contractor
    contract_category_id, -- Matches transformed_contract_category
    contract_status,
    contract_type
FROM {{ ref('cleaned_contract') }}
WHERE contract_status = 'active' -- Optional filter for active contracts
