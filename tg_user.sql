-- Table: testlearn.tg_user

-- DROP TABLE IF EXISTS testlearn.tg_user;

CREATE TABLE IF NOT EXISTS testlearn.tg_user
(
    recdate timestamp with time zone NOT NULL,
    editdate timestamp with time zone NOT NULL,
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character(32)[] COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tg_user_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS testlearn.tg_user
    OWNER to postgres;

COMMENT ON TABLE testlearn.tg_user
    IS 'Здесь указаны пользователи';

COMMENT ON COLUMN testlearn.tg_user.recdate
    IS 'дата создания записи';

COMMENT ON COLUMN testlearn.tg_user.editdate
    IS 'дата изменения';

COMMENT ON COLUMN testlearn.tg_user.user_id
    IS 'идентификатор в таблице';

COMMENT ON COLUMN testlearn.tg_user.username
    IS 'имя пользователя';