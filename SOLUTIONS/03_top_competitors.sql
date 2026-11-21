-- Challenge: Top Competitors
-- Teknik: CTE, JOIN, GROUP BY, COUNT, HAVING

WITH challenge_score AS (
    SELECT
        c.challenge_id,
        d.score AS max_scores
    FROM challenges c
    JOIN difficulty d
        ON c.difficulty_level = d.difficulty_level
),
submissions_count AS (
    SELECT
        s.hacker_id,
        COUNT(*) AS count_max_score
    FROM submissions s
    JOIN challenge_score cs
        ON s.challenge_id = cs.challenge_id
    WHERE s.score = cs.max_scores
    GROUP BY s.hacker_id
    HAVING COUNT(*) > 1
),
hacker_name AS (
    SELECT
        h.hacker_id,
        h.name,
        sc.count_max_score
    FROM submissions_count sc
    JOIN hackers h
        ON sc.hacker_id = h.hacker_id
)
SELECT
    hacker_id,
    name
FROM hacker_name
ORDER BY
    count_max_score DESC,
    hacker_id ASC;
