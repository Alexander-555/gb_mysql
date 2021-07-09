SELECT from_user_id, count(*) AS messages_num
FROM message 
WHERE to_user_id = 96 AND
	from_user_id IN 
		(
			SELECT from_user_id FROM frienship_request
			WHERE status = 1 AND to_user_id = 96
			GROUP BY from_user_id
        )
	OR
    from_user_id IN 
		(
			SELECT to_user_id FROM frienship_request
			WHERE status = 1 AND from_user_id = 96
			GROUP BY to_user_id
        )
GROUP BY from_user_id
ORDER BY messages_num DESC
LIMIT 1;
