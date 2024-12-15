{{ config(
    materialized='table',
    schema='bronze_layer'
) }}

SELECT
    contractid AS contract_id, -- Primary key
    contractorid AS contractor_id, -- Foreign key to contractors
    contractcategory AS contract_category_id, -- Foreign key to contract categories
    LOWER(title) AS contract_title, -- Normalize title to lowercase
    contractamount AS contract_value, -- Monetary value of the contract
    LOWER(contractstatus) AS contract_status, -- Normalize status to lowercase
    LOWER(contracttype) AS contract_type, -- Type of the contract
    contractnumber AS contract_number, -- Contract number
    registrationdate AS registration_date, -- Registration date
    contractstartdate AS start_date, -- Start date
    contractenddate AS end_date, -- End date
    isawarded AS awarded_flag, -- Whether the contract is awarded
    isdeleted AS deleted_flag, -- Whether the contract is deleted
    LOWER(qvd_operator_name) AS operator_name -- Metadata
FROM staging_layer.qvd_qvd_vw_bi_contract
WHERE isdeleted = FALSE -- Exclude deleted records
