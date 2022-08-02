CREATE TABLE films
(id INT(4) PRIMARY KEY,
 name VARCHAR(20),
 duration SET('60', '90', '120'));

CREATE TABLE film_sessions
(id INT(4) PRIMARY KEY,
 film_id INT(4),
 start_time DATETIME,
 price INT(5));

CREATE TABLE tickets
(id INT(4) PRIMARY KEY,
 film_session_id INT(4),
 number VARCHAR(3));

INSERT INTO films VALUES (1, 'Animals', '60'),(2, 'The Earth', '120'),(3, 'It', '60'),(4, 'Interstellar', '90'),(5, '1+1', '120');
CREATE UNIQUE INDEX unique_start ON film_sessions (start_time);
INSERT INTO film_sessions VALUES (NULL, 4, '2022-08-19 09:00', 200),(NULL, 3, '2022-08-19 10:30', 230),(NULL, 1, '2022-08-19 12:30', 450),(NULL, 3, '2022-08-19 14:00', 100),(NULL, 3, '2022-08-19 15:00', 330),(NULL, 2, '2022-08-19 20:00', 390),(NULL, 5, '2022-08-19 21:30', 420);
CREATE UNIQUE INDEX unique_number ON tickets (number);

INSERT INTO tickets VALUES
(NULL, 1, 395), (NULL, 1, 405), (NULL, 1, 482), (NULL, 1, 23), (NULL, 1, 4), (NULL, 1, 683),
(NULL, 2, 99), (NULL, 2, 35), (NULL, 2, 631), (NULL, 2, 400),
(NULL, 3, 55), (NULL, 3, 56), (NULL, 3, 88), (NULL, 3, 25), (NULL, 3, 67), (NULL, 3, 80), (NULL, 3, 22), (NULL, 3, 11), (NULL, 3, 345), (NULL, 3, 456), (NULL, 3, 567), (NULL, 3, 678),
(NULL, 4, 153), (NULL, 4, 279), (NULL, 4, 101), (NULL, 4, 110), (NULL, 4, 202), (NULL, 4, 199), (NULL, 4, 197),
(NULL, 5, 444), (NULL, 5, 788), (NULL, 5, 210),
(NULL, 6, 111), (NULL, 6, 222), (NULL, 6, 19), (NULL, 6, 91), (NULL, 6, 346),
(NULL, 7, 368), (NULL, 7, 937), (NULL, 7, 900);

-- 1
CREATE TABLE times SELECT
    0 AS id,
    films.name,
    films.duration,
    film_sessions.start_time,
    DATE_ADD(film_sessions.start_time, INTERVAL CONCAT(films.duration, ":00") MINUTE_SECOND ) AS end_time
    FROM films
    INNER JOIN film_sessions
    ON film_sessions.film_id = films.id
    ORDER BY film_sessions.start_time;
SET @i := 0; UPDATE times SET id = @i := (@i+1);
ALTER TABLE times ADD PRIMARY KEY (id);

SELECT a.name, a.start_time, a.duration, b.name, b.start_time, b.duration
FROM times a, times b
WHERE
        a.start_time <= b.end_time AND
        a.end_time >= b.start_time AND
        a.end_time <> b.end_time AND
        a.start_time <> b.start_time AND
        a.start_time > b.start_time
ORDER BY a.start_time;
-- 2
SELECT a.name, a.start_time AS start_time1, a.duration, b.start_time AS start_time2,
       TIMEDIFF(b.start_time, a.end_time) AS pause_duration
FROM times a, times b
WHERE b.id > a.id AND b.id - a.id = 1 AND
        TIMEDIFF(b.start_time, a.end_time) >= "00:30:00"
ORDER BY pause_duration DESC;
-- 3
SELECT name,
       SUM(session_visitors) AS film_visitors,
       ROUND(AVG(session_visitors), 1) AS visitors_per_session,
       SUM(session_income) AS film_income
FROM
(SELECT films.name,
film_sessions.id AS session_id,
COUNT(*) AS session_visitors,
SUM(movie_sessions.price) AS income FROM films
LEFT JOIN film_sessions ON film_sessions.film_id = films.id
LEFT JOIN tickets ON tickets.film_sessions = film_sessions.id
GROUP BY films.name, film_sessions.id) AS sessions
GROUP BY name ORDER BY income DESC;
-- 4
SET @date = '2022-08-19';
(SELECT
'08:00 - 14:59' AS time_interval,
COUNT(*) AS visitors,
SUM(movie_sessions.price) AS income
FROM movie_sessions, sold_tickets
WHERE sold_tickets.movie_session_id = movie_sessions.id
AND movie_sessions.beginning_time
BETWEEN CAST(CONCAT(@date, '08:00:00') AS DATETIME) AND CAST(CONCAT(@date, '14:59:59') AS DATETIME))
UNION
(SELECT
'15:00 - 17:59' AS time_interval,
COUNT(*) AS visitors,
SUM(movie_sessions.price) AS income
FROM movie_sessions, sold_tickets
WHERE sold_tickets.movie_session_id = movie_sessions.id
AND movie_sessions.beginning_time
BETWEEN CAST(CONCAT(@date, '15:00:00') AS DATETIME) AND CAST(CONCAT(@date, '17:59:59') AS DATETIME))
UNION
(SELECT
'18:00 - 20:59' AS time_interval,
COUNT(*) AS visitors,
SUM(movie_sessions.price) AS income
FROM movie_sessions, sold_tickets
WHERE sold_tickets.movie_session_id = movie_sessions.id
AND movie_sessions.beginning_time
BETWEEN CAST(CONCAT(@date, '18:00:00') AS DATETIME) AND CAST(CONCAT(@date, '20:59:59') AS DATETIME))
UNION
(SELECT
'21:00 - 23:59' AS time_interval,
COUNT(*) AS visitors,
SUM(movie_sessions.price) AS income
FROM movie_sessions, sold_tickets
WHERE sold_tickets.movie_session_id = movie_sessions.id
AND movie_sessions.beginning_time
BETWEEN CAST(CONCAT(@date, '21:01:00') AS DATETIME) AND CAST(CONCAT(@date, '23:59:59') AS DATETIME));