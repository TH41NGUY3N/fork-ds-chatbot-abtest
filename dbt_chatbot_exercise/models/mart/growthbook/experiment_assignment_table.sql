/*
TODO:
Convert data into format that Growthbook needs:
  - only select necessary columns
  - remove contacts that were not involved in A/B test
  - remove contacts that have no deals associated
  - unpack experiments JSON in two columns called experiment and variation
*/

-- Step 1: Select necessary columns and remove unnecessary rows
WITH assignment_view AS (
    SELECT
        number_associated_deals,
        anonymous_id,
        created_at as timestamp,
        experiments
    FROM {{ ref('staging_contacts') }}
    WHERE anonymous_id IS NOT NULL 
    AND number_associated_deals IS NOT NULL
),

-- Step 2: Parse JSON and Extract Keys and Values
unpacked_json AS (
  SELECT
    anonymous_id,
    timestamp,
    combination_pairs.combinations AS combinations
  FROM assignment_view,

  UNNEST(
    ARRAY(
      -- Step 3: Split if there is more than one experiment: variation combination
      SELECT AS STRUCT
        combinations
      FROM UNNEST(SPLIT(TO_JSON_STRING(experiments), ',')) AS combinations
    )
  ) AS combination_pairs
),

-- Step 4: Replace backslash
replace_backslash AS (
  SELECT 
    anonymous_id,
    timestamp,
    REPLACE(REPLACE(combinations, '\\', ''), '"', '') as combinations
  FROM unpacked_json
),

-- Step 5: Extract experiment and variation values with Regex
split_columns AS (
  select 
    anonymous_id,
    timestamp,
    REGEXP_EXTRACT_ALL(combinations, r'([\w-]+):') as experiment,
    REGEXP_EXTRACT_ALL(combinations, r':([\w]+)') as variation
  from replace_backslash
)

SELECT 
  anonymous_id,
  timestamp,
  ARRAY_TO_STRING(experiment, '') as experiment,
  ARRAY_TO_STRING(variation, '') as variation
FROM split_columns