-- Урок 4

DROP DATABASE vk;
CREATE DATABASE vk;

ALTER DATABASE `vk`
DEFAULT CHARACTER SET utf8

-- Переходим в папку с дампом (/home/ubuntu)
-- mysql -u root -p vk < vk.dump.sql
-- Дорабатываем тестовые данные
-- Смотрим все таблицы
SHOW TABLES;

-- Дорабатываем данные пользователей
DESC users;
SELECT * FROM users;
SELECT * FROM messages;
UPDATE users SET updated_at = NOW() WHERE updated_at < created_at;        
SELECT * FROM users;

-- Дорабатываем данные профилей
DESC profiles;
SELECT * FROM profiles;
UPDATE profiles SET photo_id = FLOOR(1 + RAND() * 100);

CREATE TEMPORARY TABLE countries (name VARCHAR(150));
INSERT INTO countries VALUES ('Russian Federation'), ('Germany'), ('Belarus');
SELECT * FROM countries;

UPDATE profiles 
  SET country = (SELECT name FROM countries ORDER BY RAND() LIMIT 1);  

-- Дорабатываем данные таблицы сообщений
DESC messages;
SELECT * FROM messages LIMIT 100;

-- Анализируем типы медиаконтента
SELECT * FROM media_types;
TRUNCATE media_types;
INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio')
;

-- Дорабатываем данные таблицы медиаконтента 
DESC media;
SELECT * FROM media LIMIT 100;
ALTER TABLE media RENAME COLUMN filename TO filepath;
UPDATE media SET media_type_id = FLOOR(1 + RAND() * 3);
UPDATE media SET user_id = FLOOR(1 + RAND() * 100);

CREATE TEMPORARY TABLE extensions (name VARCHAR(10));
INSERT INTO extensions VALUES ('jpeg'), ('avi'), ('mpeg'), ('png');
SELECT * FROM extensions;

UPDATE media SET filepath = CONCAT(
  'http://',
  filepath,
  (SELECT last_name FROM users ORDER BY RAND() LIMIT 1),
  '.',
  (SELECT name FROM extensions ORDER BY RAND() LIMIT 1)
);

UPDATE media SET size = FLOOR(10000 + (RAND() * 1000000)) WHERE size < 1000;

UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');  
ALTER TABLE media MODIFY COLUMN metadata JSON;
SELECT * FROM media LIMIT 100;

-- Дорабатываем данные таблицы дружбы
DESC friendship;
SELECT * FROM friendship LIMIT 100;
UPDATE friendship SET 
  user_id = FLOOR(1 + RAND() * 100),
  friend_id = FLOOR(1 + RAND() * 100);
UPDATE friendship SET friend_id = friend_id + 1 WHERE user_id = friend_id;
 
-- Дорабатываем данные таблицы статусов дружбы
SELECT * FROM friendship_statuses;
TRUNCATE friendship_statuses;
INSERT INTO friendship_statuses (name) VALUES
  ('Requested'),
  ('Confirmed'),
  ('Rejected'); 
UPDATE friendship SET status_id = FLOOR(1 + RAND() * 3); 

-- Дорабатываем данные таблицы групп
DESC communities;
SELECT * FROM communities;
DELETE FROM communities WHERE id > 20;

-- Дорабатываем данные таблицы пользователей и групп
SELECT * FROM communities_users;
UPDATE communities_users SET community_id = FLOOR(1 + RAND() * 20);


