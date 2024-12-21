{{ config(
    materialized='table',
    schema='bronze_layer'
) }}

SELECT
    contractid AS contract_id, -- Primary key
    contractorid AS contractor_id, -- Foreign key to contractors
    contractcategory AS contract_category_id, -- Foreign key to categories
    COALESCE(LOWER(title), 'untitled') AS contract_title, -- Handle nulls
    contractamount AS contract_value, -- Monetary value
    COALESCE(LOWER(contractstatus), 'unknown') AS contract_status, -- Handle nulls
    COALESCE(LOWER(contracttype), 'general') AS contract_type, -- Handle nulls
    contractnumber AS contract_number, -- Contract number
    registrationdate AS registration_date, -- Registration
    contractstartdate AS start_date, -- Start
    contractenddate AS end_date, -- End
    isawarded AS awarded_flag, -- Is awarded
    isdeleted AS deleted_flag, -- Is deleted
    LOWER(qvd_operator_name) AS operator_name -- Metadata
FROM iron_layer.qvd_vw_bi_contract
WHERE isdeleted = FALSE -- Exclude deleted
