-- date - основная таблица с датами

CREATE VIEW fresh5 AS SELECT * FROM dates ORDER BY created_at DESC LIMIT 5;

DELETE FROM dates WHERE (SELECT created_at FROM fresh5 WHERE created_at = dates.created_at) IS NULL;

DROP VIEW fresh5;
