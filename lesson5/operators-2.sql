UPDATE `users` 
SET created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'), 
	updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i')
WHERE id > 0;

ALTER TABLE `users` 
MODIFY `created_at` DATETIME, 
MODIFY `updated_at` DATETIME;
