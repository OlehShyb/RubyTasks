CREATE TABLE Phones
(id INT(5) PRIMARY KEY,
 user_id INT(5) NOT NULL,
 phone_number VARCHAR(10));

CREATE TABLE Rooms
(id INT(5) PRIMARY KEY,
 phone_id INT(5),
 room_number INT(4));

INSERT INTO Phones VALUES (1,2,'0957160342'), (2,3,'0667449621'), (3,4,'5629475931'), (4,1,'0966385385'), (5,6,NULL), (6,5,NULL);
-- 1
SELECT * FROM Phones WHERE phone_number LIKE '0%';
-- 2
SELECT * FROM Phones ORDER BY phone_number;
-- 3
SELECT * FROM Phones WHERE id>2 AND user_id>1;
-- 4,5
CREATE TABLE users
(id INT(5) PRIMARY KEY,
 last_name VARCHAR(20));
INSERT INTO users VALUES (1,'Shebunchak'), (2,'Ivanov'), (3,'Petrov'), (4,'Ivanov'), (5,'Ivanov'), (6,'Shebunchak');

SELECT last_name, COUNT(last_name)
FROM users
GROUP BY last_name
HAVING COUNT(last_name) > 1;
-- 6
INSERT INTO rooms VALUES (1,3,304),(2,1,184),(3,4,250),(4,2,400),(5,NULL,598),(6,NULL,123);

SELECT room_number FROM rooms INNER JOIN phones ON rooms.phone_id = phones.id;
-- 7
SELECT Users.last_name
FROM (SELECT [user_id], [phone_number] FROM phones WHERE phone_number IS NULL) phones
LEFT JOIN Users ON phones.user_id = users.id;
-- 8
select room_number from rooms where phone_id IS NULL;