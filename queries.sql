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
    full_name ILIKE 'tanvir%'
    OR full_name ILIKE '%asif%'

-- Query 3

SELECT
    booking_id,
    user_id,
    match_id,
    COALESCE(
        payment_status,
        'Action Required'
    ) as systematic_status
FROM bookings
WHERE
    payment_status is NULL

-- Query 4

SELECT bookings.booking_id, full_name, fixture, total_cost
FROM bookings
    JOIN matches on matches.match_id = bookings.match_id
    JOIN users on users.user_id = bookings.user_id

-- Query 5

SELECT users.user_id, full_name, booking_id
FROM users
    LEFT JOIN bookings on bookings.user_id = users.user_id

-- Query 6

SELECT booking_id, match_id, total_cost
FROM bookings
WHERE
    total_cost > (
        SELECT avg(total_cost)
        FROM bookings
    )

-- Query 7

SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2
OFFSET
    1