SELECT
    contractid,
    contractorid,
    contractcategory AS contract_category_id,
    title,
    contractamount,
    contractstatus,
    contracttype,
    contractnumber,
    registrationdate,
    contractstartdate,
    contractenddate,
    isawarded,
    isdeleted,
    LOWER(qvd_operator_name) AS qvd_operator_name,
    qvd_file_name,
    isextended,
    subsidiaryid
FROM bronze_layer.qvd_qvd_vw_bi_contract
WHERE isdeleted = FALSE; -- Exclude deleted records
