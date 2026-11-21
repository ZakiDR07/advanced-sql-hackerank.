-- Challenge: The Report
-- Teknik: CTE, JOIN dengan BETWEEN, CASE, ORDER BY

WITH grade_table AS (
    SELECT
        s.name,
        s.marks,
        g.grade
    FROM students s
    JOIN grades g
        ON s.marks BETWEEN g.min_mark AND g.max_mark
)
SELECT
    CASE
        WHEN grade < 8 THEN 'NULL'
        ELSE name
    END AS name,
    grade,
    marks
FROM grade_table
ORDER BY
    grade DESC,
    CASE WHEN grade >= 8 THEN name END,
    CASE WHEN grade < 8 THEN marks END;
