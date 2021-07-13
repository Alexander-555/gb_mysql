SELECT count(*) as cnt, dayname(concat(year(now()), right(birthday_at, 6))) as day
FROM users
GROUP BY day;
