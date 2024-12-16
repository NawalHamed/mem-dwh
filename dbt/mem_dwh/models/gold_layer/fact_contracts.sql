{{ config(
    materialized='table',
    schema='gold_layer'
) }}

SELECT
    c.contract_id,
    c.contract_title,
    c.contract_value,
    c.start_date,
    c.end_date,
    c.awarded_flag,
    c.contract_status,
    c.contract_type,
    cat.category_name AS contract_category_name,
    con.contractor_name AS contractor_name,
    con.contractor_classification
FROM {{ ref('transformed_contract') }} c
LEFT JOIN {{ ref('transformed_contract_category') }} cat
    ON c.contract_category_id = cat.contract_category_id
LEFT JOIN {{ ref('transformed_contractor') }} con
    ON c.contractor_id = con.contractor_id
WHERE c.contract_status = 'active'
