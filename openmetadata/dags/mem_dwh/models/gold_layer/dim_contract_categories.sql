{{ config(
    materialized='table',
    schema='gold_layer'
) }}

SELECT
    contract_category_id,
    category_name,
    category_type -- Example: 'Consulting', 'IT Services'
FROM {{ ref('transformed_contract_category') }}
