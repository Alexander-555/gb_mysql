/*
В запросе определяется коэффициент активности (activity), в который входит количество сообщений, лайков, постов и медиафайлов пользователя.
Отбирается id полное имя 10 пользователей с наименьшим activity. 
*/

SELECT 
	id as user_id,
    CONCAT(
		(SELECT firstname FROM `profile` WHERE user_id = `user`.id),
        ' ',
        (SELECT lastname FROM `profile` WHERE user_id = `user`.id)
    ) as full_name,
    (SELECT count(*) FROM message WHERE from_user_id = `user`.id OR to_user_id = `user`.id) +
		(SELECT count(*) FROM `like` WHERE user_id = `user`.id) +
		(SELECT count(*) FROM `post` WHERE user_id = `user`.id) +
		(SELECT count(*) FROM `media` WHERE user_id = `user`.id) 
		AS activity 
FROM `user`
ORDER BY activity
LIMIT 10;