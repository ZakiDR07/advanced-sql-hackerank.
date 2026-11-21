-- Challenge: Ollivander's Inventory
-- Teknik: Window function MIN() OVER (PARTITION BY)

WITH criteria_table AS (
    SELECT
        MIN(w.coins_needed) OVER (
            PARTITION BY wp.age, w.power
        ) AS min_coins,
        w.id,
        wp.age,
        w.power,
        w.coins_needed
    FROM wands w
    JOIN wands_property wp
        ON w.code = wp.code
    WHERE wp.is_evil = 0
)
SELECT
    id,
    age,
    coins_needed,
    power
FROM criteria_table
WHERE coins_needed = min_coins
ORDER BY
    power DESC,
    age DESC;
