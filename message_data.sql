-- Table: testlearn.message_data

-- DROP TABLE IF EXISTS testlearn.message_data;

CREATE TABLE IF NOT EXISTS testlearn.message_data
(
    message character(4096)[] COLLATE pg_catalog."default" NOT NULL,
    recdate timestamp with time zone NOT NULL,
    editdate timestamp with time zone NOT NULL,
    sender_id integer NOT NULL,
    message_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    CONSTRAINT message_data_pkey PRIMARY KEY (message_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS testlearn.message_data
    OWNER to postgres;

COMMENT ON COLUMN testlearn.message_data.message
    IS 'содержимое сообщения';

COMMENT ON COLUMN testlearn.message_data.recdate
    IS 'дата создания записи';

COMMENT ON COLUMN testlearn.message_data.editdate
    IS 'дата изменения записи';

COMMENT ON COLUMN testlearn.message_data.sender_id
    IS 'идентификатор отправителя сообщения';

COMMENT ON COLUMN testlearn.message_data.message_id
    IS 'идентификатор сообщения в таблице';