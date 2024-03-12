{{ config(materialized='view') }}

WITH error_queries AS (
    SELECT *
    FROM {{ ref('stg_query_history') }}
    WHERE EXECUTION_STATUS = 'FAILED'
)

SELECT
    ERROR_CODE,
    MAX(ERROR_MESSAGE) AS ERROR_MESSAGE,
    COUNT(*) AS COUNT
FROM error_queries
GROUP BY ERROR_CODE
ORDER BY ERROR_CODE
