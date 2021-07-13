SELECT round(avg(timestampdiff(YEAR, birthday_at, now()))) FROM users;
