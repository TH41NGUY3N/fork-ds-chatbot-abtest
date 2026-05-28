/*
TODO:
1. Cast columns to appropriate data type (and timezone).
    - created_at in Europe/Berlin timezone
    - num_associated_deals as integer
*/

WITH raw_contacts AS (
    SELECT
        contact_id,
        DATETIME(CAST(created_at AS TIMESTAMP), 'Europe/Berlin') AS created_at,
        hs_all_assigned_business_unit_ids as company,
        CAST(num_associated_deals AS INT) AS number_associated_deals,
        anonymous_id,
        experiments
    FROM {{ source('chatbot', 'raw_contacts') }}
)

SELECT * from raw_contacts