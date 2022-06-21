-- Среднее количество прибывающих рейсов в день для каждого города за август 2018 года

SELECT
    city,
    SUM(avg1) AS average_flights
FROM
    (
        SELECT
            airport_code,
            AVG(cnt) AS avg1
        FROM
        (
            SELECT
                EXTRACT(DAY FROM arrival_time),
                arrival_airport,
                COUNT(flight_id) AS cnt
            FROM flights
            WHERE arrival_time::DATE BETWEEN '2018-08-01' AND '2018-08-31'
            GROUP BY EXTRACT(DAY FROM arrival_time), arrival_airport
        ) AS subq1 JOIN airports ON arrival_airport=airport_code
        GROUP BY airport_code
    ) AS subq2 
    JOIN airports AS a ON a.airport_code=subq2.airport_code
    GROUP BY city