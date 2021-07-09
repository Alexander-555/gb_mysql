/*
Выводит id пользователя и количество лайков этому пользователю для 10 самых молодых пользователей
*/
SELECT
	user_id,
    (SELECT count(*) FROM `like` WHERE user_id = `profile`.user_id) as likes_num
FROM `profile`
ORDER BY birthday DESC
LIMIT 10;

/*
Выводит общее число лайков 10 самых молодых пользователей
*/
SELECT count(*) AS total_likes 
FROM `like`
WHERE user_id IN (
	SELECT * FROM (
		SELECT
			`profile`.user_id
		FROM `profile`
		ORDER BY `profile`.birthday DESC
		LIMIT 10) as some_table
	)