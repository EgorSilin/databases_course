-- Урок 8.Переписать запросы, заданые к ДЗ урока 6 с использованием JOIN

/*Урок 6. Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных
Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение.
Агрегация данных
Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:*/

/*1. Создать и заполнить таблицы лайков и постов.*/

-- 

/*2. Создать все необходимые внешние ключи и диаграмму отношений.*/

-- 

/*3. Определить кто больше поставил лайков (всего) - мужчины или женщины?*/
SELECT IF(((SELECT COUNT(id)
            FROM likes
            WHERE user_id IN (SELECT user_id
                              FROM profiles
                              WHERE gender = 'f'))
    >
           (SELECT COUNT(id)
            FROM likes
            WHERE user_id IN (SELECT user_id
                              FROM profiles
                              WHERE gender = 'm'))), 'Женщины поставили больше лайков',
          'Мужчины поставили больше лайков');
-- --------------------
SELECT IF(((SELECT COUNT(likes.id) AS likes_num
            FROM likes
                     JOIN profiles
                          ON likes.user_id = profiles.user_id
            WHERE profiles.gender = 'f')
    >
           (SELECT COUNT(likes.id) AS likes_num
            FROM likes
                     JOIN profiles
                          ON likes.user_id = profiles.user_id
            WHERE profiles.gender = 'm')), 'Женщины поставили больше лайков',
          'Мужчины поставили больше лайков') AS most_likes;

/*4. Подсчитать общее количество лайков десяти самым молодым пользователям 
 * (сколько лайков получили 10 самых молодых пользователей).*/

-- --------------------
SELECT COUNT(*)
FROM likes
WHERE target_type_id = (SELECT id FROM target_types WHERE name = 'users')
  AND target_id IN
      (SELECT *
       FROM (SELECT user_id
             FROM profiles
             ORDER BY birthday
                 DESC
             LIMIT 10)
                AS sort);
-- --------------------
SELECT SUM(likes_num)
  FROM (
    SELECT COUNT(tt.id) AS likes_num
      FROM profiles p
        LEFT JOIN likes l
          ON l.target_id = p.user_id
        LEFT JOIN target_types tt
          ON l.target_type_id = tt.id
            AND tt.name = 'users'
      GROUP BY p.user_id
      ORDER BY p.birthday DESC
      LIMIT 10
) AS youngest;
-- --------------------

/*5. Найти 10 пользователей, которые проявляют наименьшую 
 * активность в использовании социальной сети
(критерии активности необходимо определить самостоятельно).*/
	
/*Примем за критерий активности сумму постов, лайков и сообщений пользователя*/

SELECT users.id,
       CONCAT(first_name, ' ', last_name)                                     AS user,
       (SELECT COUNT(*) FROM likes WHERE likes.user_id = users.id) +
       (SELECT COUNT(*) FROM posts WHERE posts.user_id = users.id) +
       (SELECT COUNT(*) FROM messages WHERE messages.from_user_id = users.id) AS overall_activity
FROM users
ORDER BY overall_activity
LIMIT 10;
-- -----------------
SELECT u.id,
       CONCAT(u.first_name, ' ', u.last_name)       AS user,
       (l.likes_num + m.messages_num + p.posts_num) AS total_num
FROM users u
         LEFT OUTER JOIN (SELECT u.id, COUNT(l.id) AS likes_num
                          FROM users u
                                   JOIN likes l
                                        ON u.id = l.user_id
                          GROUP BY u.id
                          ORDER BY u.id) AS l
                         ON u.id = l.id
         LEFT OUTER JOIN (SELECT u.id, COUNT(m.id) AS messages_num
                          FROM users u
                                   JOIN messages m
                                        ON u.id = m.from_user_id
                          GROUP BY u.id
                          ORDER BY u.id) AS m
                         ON u.id = m.id
         LEFT OUTER JOIN (SELECT u.id, COUNT(p.id) AS posts_num
                          FROM users u
                                   JOIN posts p
                                        ON u.id = p.user_id
                          GROUP BY u.id
                          ORDER BY u.id) AS p
                         ON u.id = p.id
GROUP BY u.id
ORDER BY total_num
LIMIT 10;
-- -----------------
SELECT u.id, CONCAT(u.first_name, ' ', u.last_name)       AS user,
       COUNT(DISTINCT m.id) +
       COUNT(DISTINCT l.id) +
       COUNT(DISTINCT p.id) AS activity
FROM users u
         LEFT JOIN messages m
                   ON u.id = m.from_user_id
         LEFT JOIN likes l
                   ON u.id = l.user_id
         LEFT JOIN posts p
                   ON u.id = p.user_id
GROUP BY u.id
ORDER BY activity
LIMIT 10;
