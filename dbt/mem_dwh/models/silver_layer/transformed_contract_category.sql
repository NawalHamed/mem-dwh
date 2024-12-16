{{ config(
    materialized='table',
    schema='silver_layer'
) }}

SELECT
    contract_category_id,
    category_name,
    category_type
FROM {{ ref('datasource_qvd_contract_category') }}
