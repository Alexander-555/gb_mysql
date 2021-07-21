SELECT 
    id,
    c1.name as `Откуда`,
    c2.name as `Куда`
FROM 
    flights
JOIN 
    cities as c1
ON 
    `from` = c1.`label`
JOIN 
    cities as c2
ON 
    `to` = c2.`label`
ORDER BY 
    id;
