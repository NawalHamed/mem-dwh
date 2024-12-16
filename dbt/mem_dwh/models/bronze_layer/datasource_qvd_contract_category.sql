{{ config(
    materialized='table',
    schema='bronze_layer'
) }}

SELECT
    contractcategoryid AS contract_category_id, -- Primary key
    LOWER(COALESCE(contractcategoryname, 'unknown')) AS category_name, -- Default to 'unknown' if null
    LOWER(COALESCE(contractcategory, 'unspecified')) AS category_type -- Default to 'unspecified' if null
FROM iron_layer.qvd_vw_bi_contractcategory
