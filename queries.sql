-- Количество бронирований в текущем году по странам, исключая бронирования для технических целей
SELECT cn.name AS country, count(*) AS total 
FROM re_object o
JOIN reservation r ON o.id = r.re_object_id
JOIN city c ON c.id = o.city_id
JOIN country cn ON cn.id = c.country_id
WHERE year(r.start) = year(now())
	AND r.reservation_type_id != 1
GROUP BY cn.name;



-- Список доступных объектов в указанном городе на указанные даты (с ... по)
SET @start := '2021-08-01';
SET @end := '2021-08-10';
SET @city_id := 3;

SELECT o.id AS object_id, o.name AS object, o.city_id
FROM re_object o
JOIN reservation r ON r.re_object_id = o.id
WHERE 
	@end < r.start OR @start > r.end
GROUP BY object
HAVING o.city_id = @city_id;



-- Число объектов у каждого арендодателя, с указанием страны из профиля арендодателя. Сначала выводятся арендодатели с наибольшим числом объектов.
SELECT concat(u.firstname, ' ', u.lastname) as landlord, count(*) as total_objects, cn.name 
FROM `profile` u
JOIN re_object o ON o.owner_id = u.user_id
JOIN city c ON o.city_id = c.id
JOIN country cn ON c.country_id = cn.id
GROUP BY landlord
ORDER BY total_objects DESC;