---
-- Example Schema provided by www.springfuse.com
--

DROP ALL OBJECTS;

CREATE SEQUENCE hibernate_sequence START WITH 1000;

CREATE TABLE ADDRESS (
    id                          int not null IDENTITY,
    street_name                 varchar(100),
    city                        varchar(100) not null,
    version                     int default 0,

    primary key (id)
);

CREATE TABLE ACCOUNT (
    id                          char(36) not null,
    login                       varchar(100) not null,
    password                    varchar(100) not null,
    email                       varchar(100) not null,
    is_enabled                  bool not null default true,
    civility                    char(2) default 'MR',
    first_name                  varchar(100),
    last_name                   varchar(100),
    birth_date                  timestamp,
    description                 varchar(255),
    address_id                  int,
    creation_date               timestamp,
    creation_author             varchar(200),
    last_modification_date      timestamp,
    last_modification_author    varchar(200),
    version                     int default 0,

    constraint account_unique_1 unique (login),
    constraint account_unique_2 unique (email),
    constraint account_fk_1 foreign key (address_id) references ADDRESS,
    primary key (id)
);

CREATE TABLE ROLE (
    id                          int generated by default as identity,
    role_name                   varchar(100) not null,

    constraint role_unique_1 unique (role_name),
    primary key (id)
);

CREATE TABLE ACCOUNT_ROLE (
    account_id                  char(36) not null,
    role_id                     int not null,

    constraint account_role_fk_1 foreign key (account_id) references ACCOUNT,
    constraint account_role_fk_2 foreign key (role_id) references ROLE,
    primary key (account_id, role_id)
);

CREATE TABLE DOCUMENT (
    id                          char(36)        not null,
    account_id                  char(36)        not null,
    document_binary             bytea,
    document_file_name          varchar(100)    not null,
    document_content_type       varchar(100)    not null,
    document_size               int             not null,
    version                     int             default 0,

    constraint document_fk_1 foreign key (account_id) references ACCOUNT,
    primary key (id)
);

CREATE TABLE BOOK (
    id                          int not null IDENTITY,
    account_id                  char(36),
    title                       varchar(100) not null,
    number_of_pages             int          not null,
    version                     int          default 0,

    constraint book_fk_1 foreign key (account_id) references ACCOUNT,
    primary key (id)
);

CREATE TABLE MORE_TYPES_DEMO (
    id                           DECIMAL(15,5) not null IDENTITY,
    number_int                   int,
    number_long                  bigint,
    number_double                float,
    number_float                 real,
    number_big_integer           DECIMAL(20, 0),
    number_big_decimal           DECIMAL(20, 2),
    date_java_temporal_date      date,
    date_java_temporal_timestamp timestamp,
    date_joda                    date,
    date_time_joda               timestamp,
    version                      int default 0,

    primary key (id)
);

CREATE TABLE SAVED_SEARCH (
    id                            int not null IDENTITY,
    name                          varchar(128) not null,
    form_classname                varchar(256) not null,
    form_content                  bytea,
    account_id                    char(36),

    constraint saved_search_fk_1 foreign key (account_id) references ACCOUNT,
    primary key (id)
);

CREATE TABLE AUDIT_LOG (
    id                            int not null IDENTITY,
    author                        varchar(256),
    event                         varchar(256),
    event_date                    timestamp,
    string_attribute_1            varchar(256),
    string_attribute_2            varchar(256),
    string_attribute_3            varchar(256),
    primary key (id)
);

-- has a composite PK
CREATE TABLE LEGACY (
    name varchar(16) not null,
    code varchar(8) not null,
    dept int not null,
    extra_info varchar(100) not null,

    primary key (name, code, dept)
);

INSERT INTO ADDRESS (street_name, city) values('Avenue des champs Elysées', 'Paris');
INSERT INTO ADDRESS (street_name, city) values('Park avenue', 'New-York');
INSERT INTO ADDRESS (street_name, city) values('Tochomae', 'Tokyo');
INSERT INTO ADDRESS (street_name, city) values('California Street', 'San Francisco');

INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000001', 'admin', 'admin', 'admin@example.com', true, 1);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000002', 'user',  'user',  'user@example.com', true, 2);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000003', 'demo',  'demo',  'demo@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000004', 'user04',  'user04',  'user04@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000005', 'user05',  'user05',  'user05@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000006', 'user06',  'user06',  'user06@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000007', 'user07',  'user07',  'user07@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000008', 'user08',  'user08',  'user08@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000009', 'user09',  'user09',  'user09@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000010', 'user10',  'user10',  'user10@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000011', 'user11',  'user11',  'user11@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000012', 'user12',  'user12',  'user12@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000013', 'user13',  'user13',  'user13@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000014', 'user14',  'user14',  'user14@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000015', 'user15',  'user15',  'user15@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000016', 'user16',  'user16',  'user16@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000017', 'user17',  'user17',  'user17@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000018', 'user18',  'user18',  'user18@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000019', 'user19',  'user19',  'user19@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000020', 'user20',  'user20',  'user20@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000021', 'user21',  'user21',  'user21@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000022', 'user22',  'user22',  'user22@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000023', 'user23',  'user23',  'user23@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000024', 'user24',  'user24',  'user24@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000025', 'user25',  'user25',  'user25@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000026', 'user26',  'user26',  'user26@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000027', 'user27',  'user27',  'user27@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000028', 'user28',  'user28',  'user28@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000029', 'user29',  'user29',  'user29@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000030', 'user30',  'user30',  'user30@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000031', 'user31',  'user31',  'user31@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000032', 'user32',  'user32',  'user32@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000033', 'user33',  'user33',  'user33@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000034', 'user34',  'user34',  'user34@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000035', 'user35',  'user35',  'user35@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000036', 'user36',  'user36',  'user36@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000037', 'user37',  'user37',  'user37@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000038', 'user38',  'user38',  'user38@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000039', 'user39',  'user39',  'user39@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000040', 'user40',  'user40',  'user40@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000041', 'user41',  'user41',  'user41@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000042', 'user42',  'user42',  'user42@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000043', 'user43',  'user43',  'user43@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000044', 'user44',  'user44',  'user44@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000045', 'user45',  'user45',  'user45@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000046', 'user46',  'user46',  'user46@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000047', 'user47',  'user47',  'user47@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000048', 'user48',  'user48',  'user48@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000049', 'user49',  'user49',  'user49@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000050', 'user50',  'user50',  'user50@example.com', true, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, address_id) VALUES ('000000000000000000000000000000000051', 'disabled',  'disabled',  'disabled@example.com', false, 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, civility, address_id) VALUES ('000000000000000000000000000000000052', 'homer',  'homer',  'homer@example.com', true, 'MR', 3);
INSERT INTO ACCOUNT (id, login, password, email, is_enabled, civility, address_id) VALUES ('000000000000000000000000000000000053', 'maggy',  'maggy',  'maggy@example.com', true, 'MS', 3);

INSERT INTO ROLE (role_name) VALUES ('ROLE_ADMIN');
INSERT INTO ROLE (role_name) VALUES ('ROLE_USER');
INSERT INTO ROLE (role_name) VALUES ('ROLE_MONITORING');

INSERT INTO ACCOUNT_ROLE (account_id, role_id) VALUES ('000000000000000000000000000000000001', 1);
INSERT INTO ACCOUNT_ROLE (account_id, role_id) VALUES ('000000000000000000000000000000000001', 2);
INSERT INTO ACCOUNT_ROLE (account_id, role_id) VALUES ('000000000000000000000000000000000001', 3);
INSERT INTO ACCOUNT_ROLE (account_id, role_id) VALUES ('000000000000000000000000000000000002', 2);
INSERT INTO ACCOUNT_ROLE (account_id, role_id) VALUES ('000000000000000000000000000000000003', 2);

INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000001', 'Prime Faces User Guide' , 444);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000001', 'Spring Web Flow Reference Guide', 108);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000001', 'Spring 3.0 Reference Documentation', 770);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000001', 'Java Persistence with Hibernate', 880);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000001', 'Effective Java' , 350);

INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000002', 'How to create a web app' , 100);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000002', 'How to deal with large projects' , 544);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000002', 'How to speed up project dev?' , 453);

INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000003', 'Complete history of the universe' , 9809900);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000003', 'The Solar System' , 800);
INSERT INTO BOOK(account_id, title, number_of_pages) VALUES ('000000000000000000000000000000000003', 'The Rolling Stones' , 1800);

INSERT INTO LEGACY (name, code, dept, extra_info) VALUES ('name1', 'code1', 1, 'extra1');
INSERT INTO LEGACY (name, code, dept, extra_info) VALUES ('name2', 'code2', 2, 'extra2');
INSERT INTO LEGACY (name, code, dept, extra_info) VALUES ('name3', 'code3', 3, 'extra3');
INSERT INTO LEGACY (name, code, dept, extra_info) VALUES ('name4', 'code4', 4, 'extra4');