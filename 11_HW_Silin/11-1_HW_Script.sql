-- Урок 11. Практическое задание.
# 11.1. Практическое задание по теме “Оптимизация запросов”
# 11.1.1.	Создайте таблицу logs типа Archive.
# Пусть при каждом создании записи в таблицах users, catalogs и products
# в таблицу logs помещается время и дата создания записи, название таблицы,
# идентификатор первичного ключа и содержимое поля name.

# Создаем таблицу

DROP TABLE IF EXISTS logs;
CREATE TABLE logs
(
    created_at DATETIME    NOT NULL,
    table_name VARCHAR(45) NOT NULL,
    key_id     BIGINT(20)  NOT NULL,
    name_data  VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

# Триггер на создание пользователей
DROP TRIGGER IF EXISTS log_users_trigger;
delimiter //
CREATE TRIGGER log_users_trigger
    AFTER INSERT
    ON users
    FOR EACH ROW
BEGIN
    INSERT INTO logs (created_at, table_name, key_id, name_data)
    VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

INSERT INTO users (name, birthday_at)
VALUES ('user_name_01', '2001-01-01'),
       ('user_name_02', '2001-01-02'),
       ('user_name_03', '2001-01-03'),
       ('user_name_04', '2001-01-04'),
       ('user_name_05', '2001-01-05');

SELECT * FROM users;
SELECT * FROM logs;

# Триггер на создание каталогов
DROP TRIGGER IF EXISTS log_catalogs_trigger;
delimiter //
CREATE TRIGGER log_catalogs_trigger
    AFTER INSERT
    ON catalogs
    FOR EACH ROW
BEGIN
    INSERT INTO logs (created_at, table_name, key_id, name_data)
    VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

INSERT INTO catalogs (name)
VALUES ('catalog_name_01'),
       ('catalog_name_02'),
       ('catalog_name_03'),
       ('catalog_name_04'),
       ('catalog_name_05');

SELECT * FROM catalogs;
SELECT * FROM logs;

# Триггер на создание продуктов
delimiter //
CREATE TRIGGER log_products_trigger
    AFTER INSERT
    ON products
    FOR EACH ROW
BEGIN
    INSERT INTO logs (created_at, table_name, key_id, name_data)
    VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

INSERT INTO products (name, description, price, catalog_id)
VALUES ('prod_name_01', 'prod_desc_01', 1000.00, 10),
       ('prod_name_02', 'prod_desc_02', 2000.00, 20),
       ('prod_name_03', 'prod_desc_03', 3000.00, 30),
       ('prod_name_04', 'prod_desc_04', 4000.00, 40),
       ('prod_name_05', 'prod_desc_05', 5000.00, 50);

SELECT * FROM products;
SELECT * FROM logs;

# 11.1.2.	(по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
SELECT * FROM users;

DROP PROCEDURE IF EXISTS users_insert_procedure ;
delimiter //
CREATE PROCEDURE users_insert_procedure ()
BEGIN
	DECLARE i INT DEFAULT 100;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO users(name, birthday_at) VALUES (CONCAT('user_name_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
delimiter ;

CALL users_insert_procedure();
SELECT * FROM users ORDER BY id DESC LIMIT 10;
