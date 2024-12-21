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
    contractor_id, -- Matches contractor dimension
    contract_category_id, -- Matches category dimension
    contract_status,
    contract_type
FROM {{ ref('datasource_qvd_contract') }}
WHERE contract_status = 'active'
