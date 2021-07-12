UPDATE `users` 
SET `created_at` = now(), `updated_at` = now()
WHERE id > 0;
