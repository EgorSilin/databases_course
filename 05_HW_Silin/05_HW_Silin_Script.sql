-- 1. Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
-- mysql
-- CREATE DATABASE shop;
-- mysql shop < shop.sql

-- 1.1.	Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.

SELECT * FROM users;
SELECT NOW();

UPDATE users 
	SET created_at = NOW(),
	updated_at = NOW();
	
SELECT * FROM users;

-- 1.2. Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR 
-- и в них долгое время помещались значения в формате 20.10.2017 8:10. 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

DESC users;
SELECT *  FROM users;
ALTER TABLE users CHANGE created_at created_at VARCHAR (255);
ALTER TABLE users CHANGE updated_at updated_at VARCHAR (255);
UPDATE users 
	SET created_at = '20.10.2017 8:10',
	updated_at = '20.10.2017 8:10';

SELECT STR_TO_DATE('20.10.2017 8:10','%d.%m.%Y %H:%i');

UPDATE users 
	SET created_at = STR_TO_DATE(created_at,'%d.%m.%Y %H:%i'),
	updated_at = STR_TO_DATE(updated_at,'%d.%m.%Y %H:%i');
ALTER TABLE users CHANGE created_at created_at DATETIME;
ALTER TABLE users CHANGE updated_at updated_at DATETIME;
SELECT TIMESTAMP(created_at) FROM users;
SELECT TIMESTAMP(updated_at) FROM users;

/*1.3.	В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 * Однако нулевые запасы должны выводиться в конце, после всех записей.
*/
-- генерация данных filldb

DESC storehouses_products;
SELECT * FROM storehouses_products;
SELECT * FROM storehouses_products ORDER BY value = 0 ASC, value ASC;

/* 1.4.	(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 * Месяцы заданы в виде списка английских названий (may, august)
*/

SELECT * FROM users;
SELECT name FROM users WHERE DATE_FORMAT(birthday_at, '%M') IN ('may', 'august');

/* 1.5.	(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
 * SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
*/

SELECT * FROM catalogs;
SELECT * FROM catalogs WHERE id IN (5, 1, 2);
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY FIELD(id, 5, 1, 2);

-- 2. Практическое задание теме «Агрегация данных»

-- 2.1.	Подсчитайте средний возраст пользователей в таблице users.

SELECT * FROM users;
SELECT
  AVG (
  	(YEAR(CURRENT_DATE) - YEAR(birthday_at)) -                             
    (DATE_FORMAT(CURRENT_DATE, '%m%d') < DATE_FORMAT(birthday_at, '%m%d')) 
  ) 
AS age
FROM users;

/* 2.2.	Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/

SELECT * FROM users;
SELECT 
  DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthday_at), DAY(birthday_at))), '%W') AS day,
  COUNT(*) AS total
FROM users GROUP BY day ORDER BY total DESC;

-- 2.3.	(по желанию) Подсчитайте произведение чисел в столбце таблицы. 

SELECT * FROM users;
SELECT ROUND(EXP(SUM(LN(id)))) FROM users;

