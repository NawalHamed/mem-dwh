SELECT
    contractorid AS id,
    LOWER(contractorname) AS name, -- Normalize names to lowercase
    contactpersonemailid AS contact_email,
    phonenumber AS phone,
    contractorclassification AS classification,
    LOWER(status) AS status,
    contactpersonname AS contact_name,
    contactpersonphoneno AS contact_phone,
    registrationno AS registration_number
FROM bronze_layer.qvd_qvd_vw_bi_contractor
WHERE LOWER(status) = 'active'; -- Include only active contractors
