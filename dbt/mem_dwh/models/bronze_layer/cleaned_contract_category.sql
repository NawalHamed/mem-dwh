{{ config(
    materialized='table',
    schema='bronze_layer'
) }}

SELECT
    contractcategoryid AS contract_category_id, -- Primary key
    LOWER(contractcategoryname) AS category_name, -- Normalize names to lowercase
    LOWER(contractcategory) AS category_type -- Normalize types to lowercase
FROM staging_layer.qvd_qvd_vw_bi_contractcategory
