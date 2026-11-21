-- Challenge: Contest Leaderboard
-- Teknik: CTE, MAX, SUM, GROUP BY, HAVING, JOIN

WITH max_val AS (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) AS max_score
    FROM submissions
    GROUP BY
        hacker_id,
        challenge_id
),
new_cte_tab AS (
    SELECT
        mv.hacker_id,
        h.name,
        mv.challenge_id,
        mv.max_score
    FROM max_val mv
    JOIN hackers h
        ON mv.hacker_id = h.hacker_id
)
SELECT
    hacker_id,
    name,
    SUM(max_score) AS score
FROM new_cte_tab
GROUP BY
    hacker_id,
    name
HAVING SUM(max_score) > 0
ORDER BY
    score DESC,
    hacker_id ASC;
