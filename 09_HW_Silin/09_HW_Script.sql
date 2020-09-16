-- Урок 9. Практическое задание.

-- 9.1. Практическое задание по теме “Транзакции, переменные, представления”
-- 9.1.1.В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users. Используйте транзакции.

START TRANSACTION;
INSERT INTO sample.users
SELECT *
FROM shop.users
WHERE shop.users.id = 1;
DELETE
FROM shop.users
WHERE shop.users.id = 1;
COMMIT;

-- 9.1.2.Создайте представление, которое выводит название name товарной позиции из таблицы products
-- и соответствующее название каталога name из таблицы catalogs.

CREATE OR REPLACE VIEW prod_cat_view (prod_name, cat_name)
AS
SELECT products.name, catalogs.name
FROM products
         JOIN catalogs
              ON products.catalog_id = catalogs.id;
SELECT *
FROM prod_cat_view;

-- 9.1.3.(По желанию) Пусть имеется таблица с календарным полем created_at.
-- В ней размещены разряженые календарные записи за август 2018 года 
-- '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. 
-- Составьте запрос, который выводит полный список дат за август, 
-- выставляя в соседнем поле значение 1, если дата присутствует в исходном таблице 
-- и 0, если она отсутствует.

DROP TABLE IF EXISTS dates;
CREATE TABLE dates
(
    created_at DATE
);

INSERT INTO dates
VALUES ('2018-08-01'),
       ('2018-08-04'),
       ('2018-08-16'),
       ('2018-08-17');

SELECT *
FROM dates
ORDER BY created_at;

SELECT
	time_period.selected_date AS day,
	(SELECT EXISTS(SELECT * FROM dates WHERE created_at = day)) AS has_already
FROM
	(SELECT v.* FROM
		(SELECT ADDDATE('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) selected_date FROM
			(SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3,
		    (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v
	WHERE selected_date BETWEEN '2018-08-01' AND '2018-08-31') AS time_period
ORDER BY day;

-- 9.1.4.(по желанию) Пусть имеется любая таблица с календарным полем created_at.
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.
SELECT * FROM orders ORDER BY created_at DESC;

DELETE
FROM orders
WHERE created_at NOT IN (
    SELECT *
    FROM (
             SELECT created_at
             FROM orders
             ORDER BY created_at DESC
             LIMIT 5
         ) AS foo
)
ORDER BY created_at DESC;

SELECT * FROM orders ORDER BY created_at DESC;

-- 9.2. Практическое задание по теме “Администрирование MySQL” (эта тема изучается по вашему желанию)
-- 9.2.1.Создайте двух пользователей которые имеют доступ к базе данных shop.
-- Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
-- второму пользователю shop — любые операции в пределах базы данных shop.

DROP USER IF EXISTS 'user1'@'%';
CREATE USER 'user1'@'%' IDENTIFIED WITH sha256_password BY 'qwerty';
GRANT SELECT ON shop.* TO 'user1'@'%';

DROP USER IF EXISTS 'user2'@'%';
CREATE USER 'user2'@'%' IDENTIFIED WITH sha256_password BY 'qwerty';
GRANT ALL ON shop.* TO 'user2'@'%';
GRANT GRANT OPTION ON shop.* TO 'user2'@'%';

-- mysql -u user1 -p shop
-- mysql -u user2 -p shop
SHOW GRANTS;
INSERT INTO catalogs(name)
VALUES('TEXT');
SELECT * FROM catalogs;

-- 9.2.2.(по желанию) Пусть имеется таблица accounts содержащая три столбца id, name, password,
-- содержащие первичный ключ, имя пользователя и его пароль. 
-- Создайте представление username таблицы accounts, предоставляющий доступ к столбца id и name. 
-- Создайте пользователя user_read, который бы не имел доступа к таблице accounts, 
-- однако, мог бы извлекать записи из представления username.

-- примем за пароль столбец birthday_at таблицы shop
select * from users;

CREATE OR REPLACE VIEW usernameOnly(id, name) AS
	SELECT id, name FROM users;
select * from usernameOnly;

DROP USER IF EXISTS 'user3'@'localhost';
CREATE USER 'user3'@'localhost' IDENTIFIED WITH sha256_password BY 'qwerty';
GRANT SELECT ON shop.usernameOnly TO 'user3'@'localhost';

-- mysql -u user3 -p shop
SELECT * FROM catalogs;
SELECT * FROM usernameOnly;

-- 9.3. Практическое задание по теме “Хранимые процедуры и функции, триггеры"
-- 9.3.1.Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
-- С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
-- с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".

DELIMITER //
DROP PROCEDURE IF EXISTS hello//
DROP FUNCTION IF EXISTS hello//

CREATE FUNCTION hello()
    RETURNS TEXT DETERMINISTIC
BEGIN
    SET @time_now := CURTIME();
    IF (@time_now >= '06:00:00' AND @time_now < '12:00:00') THEN
        SET @text_out := 'Доброе утро!';
    ELSEIF (@time_now >= '12:00:00' AND @time_now < '18:00:00') THEN
        SET @text_out := 'Добрый день!';
    ELSEIF (@time_now >= '18:00:00' AND @time_now < '24:00:00') THEN
        SET @text_out := 'Добрый вечер!';
    ELSE
        SET @text_out := 'Доброй ночи!';
    END IF;
    RETURN @text_out;
END//

SELECT(CURTIME())//
SELECT hello()//
DELIMITER ;

-- 9.3.2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
-- Допустимо присутствие обоих полей или одно из них. 
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены. 
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

SELECT *
FROM products;

DROP TRIGGER IF EXISTS nullNameDescInsTr;
delimiter //
CREATE TRIGGER nullNameDescInsTr
    BEFORE INSERT
    ON products

    FOR EACH ROW
BEGIN
    IF (ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert Trigger: NULL in name and desc, operation aborted!';
    END IF;
END //
delimiter ;

DROP TRIGGER IF EXISTS nullNameDescUpdTr;
delimiter //
CREATE TRIGGER nullNameDescUpdTr
    BEFORE INSERT
    ON products

    FOR EACH ROW
BEGIN
    IF (ISNULL(NEW.name) AND ISNULL(NEW.description)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update Trigger: NULL in name and desc, operation aborted!';
    END IF;
END //
delimiter ;

INSERT INTO products (name, description, price, catalog_id)
VALUES (NULL, NULL, 1000, 10);

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Item 1', 'Desc 1', 111, 11);

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Item 2', 'Desc 2', 222, NULL);

INSERT INTO products (name, description, price, catalog_id)
VALUES ('Item 3', 'Desc 3', NULL, 33);

SELECT *
FROM products;

-- 9.3.3.(по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
-- Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел. 
-- Вызов функции FIBONACCI(10) должен возвращать число 55.

DELIMITER //
DROP FUNCTION IF EXISTS fibonacci//

CREATE FUNCTION fibonacci(value INT)
    RETURNS INT DETERMINISTIC
BEGIN
    SET @num_inp = value;
    SET @num_out := (select f
                     from (select @f := @i + @j as f, @i := @j, @j := @f
                           from information_schema.tables,
                                (select @i := 1, @j := 0) sel1
                           limit 10) t
                     ORDER BY f DESC
                     LIMIT 1);

    RETURN @num_out;
END//
DELIMITER ;

SELECT fibonacci(10);