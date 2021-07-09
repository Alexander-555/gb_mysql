SELECT gender
FROM
	(SELECT 
		(SELECT `profile`.gender 
			FROM `profile` 
			WHERE `profile`.user_id = `like`.user_id
		) as gender,
		count(*) AS like_sum
	FROM `like`
	GROUP BY gender) AS tbl
ORDER BY like_sum DESC
LIMIT 1;