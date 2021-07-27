DELIMITER //

CREATE TRIGGER check_products_in BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NEW.name IS NULL AND NEW.description IS NULL 
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field "name" or "description" should not have null value';
	END IF;
END//

CREATE TRIGGER check_products_up BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.name IS NULL AND NEW.description IS NULL 
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Field "name" or "description" should not have null value';
	END IF;
END//

DELIMITER ;
