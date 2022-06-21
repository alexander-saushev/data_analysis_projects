-- Количество вылетов из каждого аэропорта

SELECT
    departure_airport,
    COUNT(flight_id) AS cnt_flights
FROM
    flights
GROUP BY
    departure_airport
ORDER BY
    cnt_flights DESC