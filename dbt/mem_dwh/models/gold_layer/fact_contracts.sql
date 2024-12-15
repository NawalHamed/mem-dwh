{{ config(
    materialized='table',
    schema='gold_layer'
) }}

SELECT
    con.contract_id,
    con.contract_value AS total_contract_value, -- Measurement
    con.start_date,
    con.end_date,
    cat.contract_category_id,
    cont.contractor_id,
    dd.date_id AS start_date_id,
    dd_end.date_id AS end_date_id
FROM {{ ref('transformed_contract') }} con
LEFT JOIN {{ ref('transformed_contract_category') }} cat
    ON con.contract_category_id = cat.contract_category_id
LEFT JOIN {{ ref('transformed_contractor') }} cont
    ON con.contractor_id = cont.contractor_id
LEFT JOIN {{ ref('dim_date') }} dd
    ON con.start_date = dd.date
LEFT JOIN {{ ref('dim_date') }} dd_end
    ON con.end_date = dd_end.date
