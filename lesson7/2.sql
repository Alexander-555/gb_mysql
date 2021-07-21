SELECT 
    products.name as `Товар`,
    products.description as `Описание товара`,
    catalogs.name as `Каталог`
FROM
    products
LEFT JOIN 
    catalogs
ON
    products.catalog_id = catalogs.id;
