-- Количество рейсов на каждой модели самолёта с вылетом в сентябре 2018 года

SELECT
    aircrafts.model AS model,
    COUNT(flights.flight_id) AS flights_amount
FROM
    flights
    LEFT JOIN aircrafts ON aircrafts.aircraft_code = flights.aircraft_code
WHERE
    CAST(flights.departure_time AS date) >= '2018-09-01'
    AND
    CAST(flights.departure_time AS date) <= '2018-09-30'
GROUP BY
    aircrafts.model    