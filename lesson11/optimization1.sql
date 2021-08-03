CREATE TABLE `logs` (
  `id_key` INT NULL,
  `table_name` VARCHAR(20) NULL,
  `name` VARCHAR(100) NULL,
  `created` DATETIME NULL)
ENGINE = ARCHIVE;


DELIMITER //

CREATE TRIGGER catalogs_log AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN   
    INSERT INTO `logs` (id_key, table_name, name, created)
		SELECT id, 'catalogs', name, now() 
		FROM catalogs
        WHERE id = (SELECT max(id) FROM catalogs);
END//

CREATE TRIGGER products_log AFTER INSERT ON products
FOR EACH ROW
BEGIN   
    INSERT INTO `logs` (id_key, table_name, name, created)
		SELECT id, 'products', name, created_at
		FROM products
        WHERE id = (SELECT max(id) FROM products);
END//

CREATE TRIGGER users_log AFTER INSERT ON users
FOR EACH ROW
BEGIN   
    INSERT INTO `logs` (id_key, table_name, name, created)
		SELECT id, 'users', name, created_at
		FROM users
        WHERE id = (SELECT max(id) FROM users);
END//

DELIMITER ;
