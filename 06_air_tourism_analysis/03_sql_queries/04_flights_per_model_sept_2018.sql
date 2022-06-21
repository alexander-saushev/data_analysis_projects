-- Количество рейсов по всем моделям самолётов Boeing, Airbus и другим в сентябре 2018

SELECT
    (
    CASE
        WHEN aircrafts.model LIKE 'Boeing%' THEN 'Boeing'
        WHEN aircrafts.model LIKE 'Airbus%' THEN 'Airbus'
        ELSE 'other'
    END    
    ) AS type_aircraft,
    COUNT(flights.flight_id) AS flights_amount
FROM
    flights
    INNER JOIN aircrafts ON aircrafts.aircraft_code = flights.aircraft_code
WHERE
    CAST(flights.departure_time AS date) >= '2018-09-01'
    AND
    CAST(flights.departure_time AS date) <= '2018-09-30'
GROUP BY
    type_aircraft