-- Сколько билетов в Москву куплено на каждой неделе с с 23 июля по 30 сентября 2018

SELECT
    EXTRACT(week FROM flights.arrival_time) AS week_number,
    COUNT(ticket_flights.ticket_no) AS ticket_amount,
    SUBQ.festival_week,
    SUBQ.festival_name    
FROM
    flights
    JOIN ticket_flights ON ticket_flights.flight_id = flights.flight_id
    JOIN airports ON airports.airport_code = flights.arrival_airport
    LEFT JOIN
    (
        SELECT
            festival_name,
            EXTRACT(week FROM festival_date) AS festival_week
        FROM
            festivals
        WHERE
            festival_city = 'Москва'
            AND
            festival_date >= '2018-07-23'
            AND
            festival_date <= '2018-09-30'
    ) AS SUBQ
    ON festival_week = EXTRACT(week FROM flights.arrival_time)
WHERE
    airports.city = 'Москва'
    AND
    flights.arrival_time > '2018-07-23'
    AND
    flights.arrival_time < '2018-10-01'
GROUP BY
    EXTRACT(week FROM flights.arrival_time),
    SUBQ.festival_week,
    SUBQ.festival_name