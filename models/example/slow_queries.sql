{{ config(materialized='view') }}

WITH slow_queries AS (
    SELECT *
    FROM {{ ref('stg_query_history') }}
    WHERE TOTAL_ELAPSED_TIME > 300000 -- Filter for queries taking longer than 300,000 milliseconds (5 minutes)
)

SELECT
    QUERY_ID,
    QUERY_TEXT,
    DATABASE_NAME,
    SCHEMA_NAME,
    USER_NAME,
    ROLE_NAME,
    WAREHOUSE_NAME,
    EXECUTION_STATUS,
    START_TIME,
    END_TIME,
    TOTAL_ELAPSED_TIME
FROM slow_queries
ORDER BY TOTAL_ELAPSED_TIME DESC
