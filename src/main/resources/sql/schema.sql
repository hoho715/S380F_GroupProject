drop table if exists POLL_COMMENT;
drop table if exists LECTURE_COMMENT;
drop table if exists POLL_RESPONSE;
drop table if exists POLL_OPTION;
drop table if exists POLL;
drop table if exists ATTACHMENT;
drop table if exists LECTURE;
drop table if exists REG_USER;



create table if not exists LECTURE
(
    ID                  BIGINT auto_increment
        primary key,
    LECTURE_NAME        CHARACTER VARYING(255),
    LECTURE_DESCRIPTION CHARACTER VARYING(255)
);

create table if not exists ATTACHMENT
(
    ID           UUID default RANDOM_UUID() not null
        primary key,
    CONTENT      BINARY LARGE OBJECT,
    LECTURE_ID   BIGINT,
    CONTENT_TYPE CHARACTER VARYING(255),
    FILENAME     CHARACTER VARYING(255),
    constraint FKA6APWE76XLLJXTM3NIMRLVPPF
        foreign key (LECTURE_ID) references LECTURE
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
    ID            BIGINT auto_increment
        primary key,
    EMAIL_ADDRESS CHARACTER VARYING(255),
    FULL_NAME     CHARACTER VARYING(255),
    PASSWORD      CHARACTER VARYING(255),
    PHONE_NUMBER  CHARACTER VARYING(255),
    ROLE          ENUM ('ROLE_USER', 'ROLE_ADMIN'),
    USERNAME      CHARACTER VARYING(255)
        unique
);

create table if not exists LECTURE_COMMENT
(
    ID         BIGINT auto_increment
        primary key,
    CONTENT    CHARACTER VARYING(255),
    LECTURE_ID BIGINT,
    USER_ID    BIGINT,
    constraint FKGHRC1G80KR6NB7WCQ4IR5VSG0
        foreign key (USER_ID) references REG_USER,
    constraint FKNYSPICR4WIKY666G6YEJCKKQE
        foreign key (LECTURE_ID) references LECTURE
);

create table if not exists POLL_COMMENT
(
    ID      BIGINT auto_increment
        primary key,
    CONTENT CHARACTER VARYING(255),
    POLL_ID BIGINT,
    USER_ID BIGINT,
    constraint FK5XO8QE4UNJBFLXE8649GDT6UG
        foreign key (POLL_ID) references POLL,
    constraint FKPUECGVWUDWIWI28IC0LS58SVH
        foreign key (USER_ID) references REG_USER
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