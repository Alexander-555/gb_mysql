SET @r := 0;

SELECT 
	IF(i.day < 10, concat("2018-08-0", i.day), concat("2018-08-", i.day)) AS date,
    (SELECT created_at FROM dates WHERE created_at = IF(i.day < 10, concat("2018-08-0", i.day), concat("2018-08-", i.day))) IS NOT NULL AS is_present
FROM
	(
		SELECT @r := @r + 1 AS `day` 
        FROM 
			(select 1 union select 2 union select 3 union select 4) t1,
			(select 1 union select 2 union select 3 union select 4) t2,
			(select 1 union select 2 union select 3 union select 2) t3
		LIMIT 31
	) AS i;
