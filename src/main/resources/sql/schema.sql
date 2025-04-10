DROP TABLE if exists POLL_RESPONSE;
DROP TABLE if exists POLL_OPTION;
DROP TABLE if exists REG_USER;
DROP TABLE if exists POLL;
DROP TABLE if exists LECTURE;

create table if not exists LECTURE
(
    ID           BIGINT auto_increment
        primary key,
    LECTURE_NAME CHARACTER VARYING(255)
);

create table if not exists POLL
(
    ID         BIGINT auto_increment
        primary key,
    LECTURE_ID BIGINT,
    QUESTION   CHARACTER VARYING(255),
    constraint FK6CBLWD4BN2N8E0YPLIKA8BRWF
        foreign key (LECTURE_ID) references LECTURE
);

create table if not exists POLL_OPTION
(
    ID      BIGINT auto_increment
        primary key,
    TEXT    CHARACTER VARYING(255),
    POLL_ID BIGINT,
    constraint FK81HNIV4VVDII51KRAO5F84HEN
        foreign key (POLL_ID) references POLL
);

create table if not exists REG_USER
(
    ID            BIGINT auto_increment primary key,
    EMAIL_ADDRESS CHARACTER VARYING(255) NULL,
    FULL_NAME     CHARACTER VARYING(255),
    PASSWORD      CHARACTER VARYING(255),
    PHONE_NUMBER  CHARACTER VARYING(255) NULL,
    ROLE          ENUM ('ROLE_USER', 'ROLE_ADMIN'),
    USERNAME      CHARACTER VARYING(255) UNIQUE
);

create table if not exists POLL_RESPONSE
(
    ID            BIGINT auto_increment
        primary key,
    RESPONSE_TIME TIMESTAMP,
    POLL_ID       BIGINT,
    OPTION_ID     BIGINT,
    USER_ID       BIGINT,
    constraint FK9NTAXLCKDYJ5AKTMQF9MT7XXE
        foreign key (USER_ID) references REG_USER,
    constraint FK9RUJQLJPP3FI1DO8PTWBYNC20
        foreign key (POLL_ID) references POLL,
    constraint FKMB7ATE198QEUHPP33NXVXHE9A
        foreign key (OPTION_ID) references POLL_OPTION
);