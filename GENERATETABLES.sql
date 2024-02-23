-- DROP SCHEMA testlearn;

CREATE SCHEMA testlearn AUTHORIZATION postgres;

COMMENT ON SCHEMA testlearn IS 'Learning Postgres';

-- DROP SEQUENCE testlearn.message_data_message_id_seq;

CREATE SEQUENCE testlearn.message_data_message_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE testlearn.tg_user_user_id_seq;

CREATE SEQUENCE testlearn.tg_user_user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- testlearn.group_data определение

-- Drop table

-- DROP TABLE testlearn.group_data;

CREATE TABLE testlearn.group_data (

);


-- testlearn.tg_user определение

-- Drop table

-- DROP TABLE testlearn.tg_user;

CREATE TABLE testlearn.tg_user (
	recdate timestamptz NOT NULL, -- дата создания записи
	editdate timestamptz NOT NULL, -- дата изменения
	user_id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL, -- идентификатор в таблице
	username _bpchar NOT NULL, -- имя пользователя
	CONSTRAINT tg_user_pkey PRIMARY KEY (user_id)
);
COMMENT ON TABLE testlearn.tg_user IS 'Здесь указаны пользователи';

-- Column comments

COMMENT ON COLUMN testlearn.tg_user.recdate IS 'дата создания записи';
COMMENT ON COLUMN testlearn.tg_user.editdate IS 'дата изменения';
COMMENT ON COLUMN testlearn.tg_user.user_id IS 'идентификатор в таблице';
COMMENT ON COLUMN testlearn.tg_user.username IS 'имя пользователя';


-- testlearn.message_data определение

-- Drop table

-- DROP TABLE testlearn.message_data;

CREATE TABLE testlearn.message_data (
	message _bpchar NOT NULL, -- содержимое сообщения
	recdate timestamptz NOT NULL, -- дата создания записи
	editdate timestamptz NOT NULL, -- дата изменения записи
	sender_id int4 NULL, -- идентификатор отправителя сообщения
	message_id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL, -- идентификатор сообщения в таблице
	CONSTRAINT message_data_pkey PRIMARY KEY (message_id),
	CONSTRAINT message_data_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES testlearn.tg_user(user_id)
);

-- Column comments

COMMENT ON COLUMN testlearn.message_data.message IS 'содержимое сообщения';
COMMENT ON COLUMN testlearn.message_data.recdate IS 'дата создания записи';
COMMENT ON COLUMN testlearn.message_data.editdate IS 'дата изменения записи';
COMMENT ON COLUMN testlearn.message_data.sender_id IS 'идентификатор отправителя сообщения';
COMMENT ON COLUMN testlearn.message_data.message_id IS 'идентификатор сообщения в таблице';