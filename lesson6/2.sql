/*
Запрос выводит id друга пользователя, отправившего максимальное число сообщений нашему пользователю, а также число сообщений, которые отправил друг.
*/
SELECT from_user_id, count(*) AS messages_num
FROM message 
WHERE to_user_id = 96 AND
	from_user_id IN 
		(
			SELECT
				IF(from_user_id = 96, to_user_id, from_user_id) AS friend_id
			FROM friendship_request
			WHERE
				(from_user_id = 96 OR to_user_id = 96)
				AND 
				`status` = 1
        	)
GROUP BY from_user_id
ORDER BY messages_num DESC
LIMIT 1;
