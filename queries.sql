-- Query 1
SELECT *
FROM matches
WHERE
    tournament_category = 'Champions League'
    AND match_status = 'Available'

-- Query 2

SELECT *
FROM users
WHERE
    full_name ILIKE 'Tanvfir%'
    OR full_name ILIKE '%Haque%'