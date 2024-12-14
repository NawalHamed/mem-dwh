SELECT
    contractcategoryid AS id,
    LOWER(contractcategoryname) AS name, -- Normalize names to lowercase
    contractcategory AS code,
    LOWER(qvd_operator_name) AS qvd_operator_name,
    qvd_file_name
FROM bronze_layer.qvd_qvd_vw_bi_contractcategory;
