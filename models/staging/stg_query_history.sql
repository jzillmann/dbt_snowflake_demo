WITH source AS (
    SELECT *
    FROM {{ source('snowflake_account_usage', 'query_history') }}
)

SELECT
    QUERY_ID,
    QUERY_TEXT,
    QUERY_TYPE,
    DATABASE_NAME,
    SCHEMA_NAME,
    USER_NAME,
    ROLE_NAME,
    WAREHOUSE_NAME,
    WAREHOUSE_SIZE,
    EXECUTION_STATUS,
    ERROR_CODE,
    ERROR_MESSAGE,
    START_TIME,
    END_TIME,
    TOTAL_ELAPSED_TIME
FROM source
