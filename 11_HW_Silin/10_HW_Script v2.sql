# Урок 10. Вебинар. Транзакции, переменные, представления. Администрирование. Хранимые процедуры и функции, триггеры
# Задания на БД vk:

# 2. Задание на оконные функции
# Построить запрос, который будет выводить следующие столбцы:
# имя группы
# среднее количество пользователей в группах
# самый молодой пользователь в группе
# самый старший пользователь в группе
# общее количество пользователей в группе
# всего пользователей в системе
# отношение в процентах
# (общее количество пользователей в группе / всего пользователей в системе) * 100
-- ---------------------------------------------------------
SELECT *
FROM communities;

SELECT *
FROM communities_users
ORDER BY community_id;

SELECT *
FROM profiles;
-- ------------------------
# 1. Обратите пожалуйста внимание что всего пользователей в система и
# общее количество пользователей в группах это в общем случае абсолютно различные значения.
# 2. MAX(communities.id) OVER () - такой подход сработает верно совсем не всегда,
# группы могут удаляться, идентификаторы идти не по порядку.
# 3. Самого молодого и старшего нужно поменять местами в комментариях.
# 4. В выаод не попадут группы, если в них нет участников.

SELECT DISTINCT c.id,
                # имя группы
                c.name,
                # общее количество пользователей в группе
                COUNT(cu.user_id) OVER cu_user_num                                          AS users_num_in_group,
                # всего пользователей в системе
                (SELECT COUNT(profiles.user_id) FROM profiles)                              AS all_users_in_system,
                # отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100
                COUNT(cu.user_id) OVER cu_user_num / COUNT(cu.user_id) OVER () * 100        AS '%',
                # среднее количество пользователей в группах
                COUNT(cu.user_id) OVER () / (SELECT COUNT(communities.id) FROM communities) AS avg_users_in_all_groups,
                # самый старший пользователь в группе
                MIN(p.birthday) OVER cu_user_num                                            AS min_birthday,
                # самый молодой пользователь в группе
                MAX(p.birthday) OVER cu_user_num                                            AS max_birthday
FROM communities_users cu
         RIGHT JOIN profiles p
                    ON cu.user_id = p.user_id
         LEFT JOIN communities c
                   ON c.id = cu.community_id
    WINDOW cu_user_num AS (PARTITION BY cu.community_id ORDER BY cu.community_id)
ORDER BY c.id;
-- -----------------------------------------------