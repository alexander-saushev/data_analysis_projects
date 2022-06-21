-- Фестивали, которые проходили с 23 июля по 30 сентября 2018 года в Москве с номерами недели

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