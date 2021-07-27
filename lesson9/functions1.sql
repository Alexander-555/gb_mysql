DELIMITER //

CREATE FUNCTION hello ()
RETURNS varchar(12) DETERMINISTIC
BEGIN
    DECLARE h int;
    DECLARE t varchar(12);
    
    SET h = hour(now());
    
    IF h >= 6 AND h < 12 THEN SET t = 'Доброе утро';
    ELSEIF h >= 12 AND h < 18 THEN SET t = 'Добрый день';
    ELSEIF h >= 18 THEN SET t = 'Добрый вечер';
    ELSEIF h >= 0 AND h < 6 THEN SET t = 'Доброй ночи';
    ELSE SET t = 'Не удается определить время...';
    END IF;

    RETURN t;
END//

DELIMITER ;
