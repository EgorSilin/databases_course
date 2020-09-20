# Урок 10. Вебинар. Транзакции, переменные, представления. Администрирование. Хранимые процедуры и функции, триггеры
# Задания на БД vk:

# 1. Проанализировать какие запросы могут выполняться наиболее
# часто в процессе работы приложения и добавить необходимые индексы.

CREATE INDEX profiles_birthday_idx ON profiles(birthday);
CREATE INDEX media_size_idx ON media(size);

CREATE UNIQUE INDEX users_email_uq ON users(email);
CREATE UNIQUE INDEX users_phone_uq ON users(phone);
CREATE UNIQUE INDEX communities_name_uq ON communities(name);

CREATE INDEX users_firstName_lastName_idx ON users (first_name, last_name);
CREATE INDEX messages_fuid_touid_idx ON messages (from_user_id, to_user_id);
CREATE INDEX likes_ttid_tid_idx ON likes (target_type_id, target_id);

CREATE UNIQUE INDEX friendship_idx ON friendship (status_id, user_id, friend_id);

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
SELECT * FROM communities;
SELECT * FROM communities_users ORDER BY community_id;
SELECT * FROM profiles;
-- -------------------------------------------------------------------------
SELECT DISTINCT communities.id,
                # имя группы
                communities.name,
                # общее количество пользователей в группе
                COUNT(communities_users.user_id) OVER cu_user_num AS users_num_in_groups,
                # всего пользователей в системе
                COUNT(communities_users.user_id) OVER ()          AS total_users_in_all_groups,
                # отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100
                COUNT(communities_users.user_id) OVER cu_user_num / COUNT(communities_users.user_id) OVER () * 100          AS '%',
                # среднее количество пользователей в группах
                COUNT(communities_users.user_id) OVER () / MAX(communities.id) OVER () AS avg_users_in_all_groups,
                # самый молодой пользователь в группе
                MIN(profiles.birthday) OVER cu_user_num AS min_birthday,
                # самый старший пользователь в группе
                MAX(profiles.birthday) OVER cu_user_num AS max_birthday
FROM communities
         JOIN communities_users
              ON communities.id = communities_users.community_id
         JOIN profiles
             ON communities_users.user_id = profiles.user_id
    WINDOW cu_user_num AS (PARTITION BY communities_users.community_id ORDER BY communities_users.community_id)
ORDER BY communities.id;
