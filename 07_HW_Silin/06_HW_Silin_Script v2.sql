/*Урок 6. Вебинар. Операторы, фильтрация, сортировка и ограничение. Агрегация данных
Практическое задание по теме “Операторы, фильтрация, сортировка и ограничение.
Агрегация данных
Работаем с БД vk и тестовыми данными, которые вы сгенерировали ранее:*/


/*4. Подсчитать общее количество лайков десяти самым молодым пользователям 
 * (сколько лайков получили 10 самых молодых пользователей).*/

-- --------------------
SELECT COUNT(*) FROM likes 
	WHERE target_type_id = (SELECT id FROM target_types WHERE name = 'users')
		AND target_id IN 
			(SELECT * FROM 
				(SELECT user_id 
				FROM profiles 
				ORDER BY birthday 
				DESC LIMIT 10)
			AS sort);

-- --------------------

/*5. Найти 10 пользователей, которые проявляют наименьшую 
 * активность в использовании социальной сети
(критерии активности необходимо определить самостоятельно).*/
	
/*Пример за критерий активности сумму постов, лайков и сообщений пользователя*/


-- --------------------
SELECT user_id, COUNT(counts) AS num 
FROM 
	(SELECT user_id AS user_id, id AS counts FROM likes
	UNION ALL
	SELECT from_user_id AS user_id, id AS counts FROM messages
	UNION ALL
	SELECT user_id AS user_id, id AS counts FROM posts) AS tab_1
GROUP BY tab_1.user_id
ORDER BY num
LIMIT 10;
-- --------------------








