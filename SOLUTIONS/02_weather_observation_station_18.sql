-- Challenge: Weather Observation Station 18
-- Teknik: CTE, MIN, MAX, ABS, CAST
-- Manhattan Distance = |min(lat_n) - max(lat_n)| + |min(long_w) - max(long_w)|

WITH agg_table AS (
    SELECT
        MIN(lat_n) AS min_lat,
        MAX(lat_n) AS max_lat,
        MIN(long_w) AS min_long,
        MAX(long_w) AS max_long
    FROM station
)
SELECT
    CAST(
        ABS(min_lat - max_lat) + ABS(min_long - max_long)
        AS DECIMAL(10, 4)
    )
FROM agg_table;
