-- Тема “Сложные запросы”

/*1. Составьте список пользователей users, 
 * которые осуществили хотя бы один заказ orders в интернет магазине.*/
-- --------------------
DESC users ;
INSERT INTO users (name, birthday_at)
VALUES ('Всеволод', '1977-07-07');

SELECT id, name, birthday_at FROM users;
SELECT * FROM products p ;
SELECT * FROM orders o ;
SELECT * FROM orders_products op ;

SELECT u.id, u.name, u.birthday_at, COUNT(u.id) AS count_num
  FROM users AS u
   JOIN orders AS o
     ON u.id = o.user_id
    	GROUP BY id;
-- --------------------
/*2. Выведите список товаров products и разделов catalogs, который соответствует товару.*/
-- --------------------
SELECT * FROM products p ;
SELECT * FROM catalogs c ;
    
SELECT
  p.id,
  p.name,
  p.price,
  c.name AS catalog
  FROM products AS p
    LEFT JOIN catalogs AS c
      ON p.catalog_id = c.id;
     
 -- --------------------
/*3. (по желанию) Пусть имеется таблица рейсов flights (id, from, to) 
 * и таблица городов cities (label, name). 
 * Поля from, to и label содержат английские названия городов, поле name — русское. 
 * Выведите список рейсов flights с русскими названиями городов.*/
-- --------------------

     
DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255) COMMENT 'Город отравления',
  `to` VARCHAR(255) COMMENT 'Город прибытия'
) COMMENT = 'Рейсы';

INSERT INTO flights (`from`, `to`) VALUES
('moscow', 'omsk'),
('novgorod', 'kazan'),
('irkutsk', 'moscow'),
('omsk', 'irkutsk'),
('moscow', 'kazan');

SELECT * FROM flights f ;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  label VARCHAR(255) COMMENT 'Код города',
  name VARCHAR(255) COMMENT 'Название города'
) COMMENT = 'Словарь городов';

INSERT INTO cities (label, name) VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

SELECT
  f.id,
  cities_from.name AS `from`,
  cities_to.name AS `to`
FROM flights AS f
  JOIN cities AS cities_from
    ON f.from = cities_from.label
  JOIN cities AS cities_to
    ON f.to = cities_to.label;
-- --------------------








