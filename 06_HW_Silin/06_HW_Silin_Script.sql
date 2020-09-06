/*Урок 6. Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных
Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение.
Агрегация данных
Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:*/

/*1. Создать и заполнить таблицы лайков и постов.*/

-- Таблица лайков
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESC likes;

-- Таблица типов лайков
DROP TABLE IF EXISTS target_types;
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESC target_types;

-- Заполняем типы
INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');
SELECT *  FROM target_types;
 
-- Заполняем лайки
INSERT INTO likes 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 100)),
    FLOOR(1 + (RAND() * 4)),
    CURRENT_TIMESTAMP 
  FROM messages;

SELECT * FROM likes;

-- Создадим таблицу постов
TRUNCATE TABLE posts; 

CREATE TABLE posts (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  community_id INT UNSIGNED,
  head VARCHAR(255),
  body TEXT NOT NULL,
  media_id INT UNSIGNED,
  is_public BOOLEAN DEFAULT TRUE,
  is_archived BOOLEAN DEFAULT FALSE,
  views_counter INT UNSIGNED DEFAULT 0,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DESC posts;
SELECT * FROM posts;
-- Заполняем posts
INSERT INTO posts 
  SELECT 
    id, 
    FLOOR(1 + (RAND() * 100)), 
    FLOOR(1 + (RAND() * 15)),
    'head_text',
    body,
    FLOOR(1 + (RAND() * 20)),
    FLOOR(0 + (RAND() * 1)),
	FLOOR(0 + (RAND() * 1)),    
	FLOOR(1 + (RAND() * 20)),
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP
  FROM messages;

SELECT * FROM messages;
SELECT * FROM communities;

/*2. Создать все необходимые внешние ключи и диаграмму отношений.*/

-- Для таблицы profiles
DESC profiles;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE,
  ADD CONSTRAINT profiles_photo_id_fk
    FOREIGN KEY (photo_id) REFERENCES media(id)
      ON DELETE SET NULL;

-- Изменяем тип столбца при необходимости
ALTER TABLE profiles DROP FOREIGN KEY profiles_user_id_fk;
ALTER TABLE profiles MODIFY COLUMN photo_id INT(10) UNSIGNED;
      
-- Для таблицы messages
DESC messages;
ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);

-- Если нужно удалить
ALTER TABLE table_name DROP FOREIGN KEY constraint_name;

-- Для таблицы media
DESC media;
ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT media_media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id);

-- Для таблицы communities_users
DESC communities_users;
ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT communities_users_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id);
   
-- Для таблицы friendship
DESC friendship;
ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);
 SELECT * FROM target_types;

-- Для таблицы likes
DESC likes;
ALTER TABLE likes
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT likes_target_type_id_fk 
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
  /*ADD CONSTRAINT likes_target_users_id_fk 
    FOREIGN KEY (target_id) REFERENCES users(id),
  ADD CONSTRAINT likes_target_messages_id_fk 
    FOREIGN KEY (target_id) REFERENCES messages(id),
  ADD CONSTRAINT likes_target_media_id_fk 
    FOREIGN KEY (target_id) REFERENCES media(id),
  ADD CONSTRAINT likes_target_posts_id_fk 
    FOREIGN KEY (target_id) REFERENCES posts(id);*/

-- Для таблицы posts
DESC posts;
ALTER TABLE posts
  ADD CONSTRAINT posts_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT posts_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id),
  ADD CONSTRAINT media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id);
 
/*ALTER TABLE posts DROP FOREIGN KEY posts_user_id_fk;
ALTER TABLE posts DROP FOREIGN KEY posts_community_id_fk; 
ALTER TABLE posts DROP FOREIGN KEY media_id_fk;*/ 
 
 SELECT * FROM target_types;

/*3. Определить кто больше поставил лайков (всего) - мужчины или женщины?*/

SELECT COUNT(id) FROM likes 
WHERE user_id IN (SELECT user_id FROM profiles
	WHERE gender = 'f');

SELECT COUNT(id) FROM likes 
WHERE user_id IN (SELECT user_id FROM profiles
	WHERE gender = 'm');

SELECT IF(((SELECT COUNT(id) FROM likes 
WHERE user_id IN (SELECT user_id FROM profiles
	WHERE gender = 'f'))
>
(SELECT COUNT(id) FROM likes 
WHERE user_id IN (SELECT user_id FROM profiles
	WHERE gender = 'm'))), "Женщины поставили больше лайков", "Мужчины поставили больше лайков");



/*4. Подсчитать общее количество лайков десяти самым молодым пользователям 
 * (сколько лайков получили 10 самых молодых пользователей).*/

CREATE TEMPORARY TABLE extensions (user_id INT);
INSERT INTO extensions 
	(SELECT user_id FROM profiles ORDER BY birthday DESC LIMIT 10);
SELECT * FROM extensions;

SELECT COUNT(id) FROM likes 
	WHERE user_id IN 
		(SELECT user_id	FROM extensions);


/*5. Найти 10 пользователей, которые проявляют наименьшую 
 * активность в использовании социальной сети
(критерии активности необходимо определить самостоятельно).*/
	
/*Пример за критерий активности сумму постов, лайков и сообщений пользователя*/

CREATE TEMPORARY TABLE extensions2 (user_id INT, counts INT);
INSERT INTO extensions2 
	((SELECT user_id AS user_id, COUNT(id) AS counts FROM likes GROUP BY user_id)
	UNION
	(SELECT from_user_id AS user_id, COUNT(id) AS counts FROM messages GROUP BY from_user_id)
	UNION
	(SELECT user_id AS user_id, COUNT(id) AS counts FROM posts GROUP BY user_id));

SELECT user_id, counts FROM extensions2 ORDER BY counts LIMIT 10;
	
	
