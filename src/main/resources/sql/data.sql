INSERT INTO LECTURE (LECTURE_NAME,LECTURE_DESCRIPTION) VALUES ('Lecture 1','Lecture 1 Description');

INSERT INTO ATTACHMENT (ID, CONTENT, LECTURE_ID, CONTENT_TYPE, FILENAME) VALUES ('ee07dca3-7f09-4939-ae94-975e8504e6b6', 'Lecture 1 note 1 content', 1, 'text/plain', 'Lecture 1 note 1 .txt');
INSERT INTO ATTACHMENT (ID, CONTENT, LECTURE_ID, CONTENT_TYPE, FILENAME) VALUES ('81f419a2-6816-40ac-8638-4f11fc4edeb1', 'Lecture 1 note 2 content', 1, 'text/plain', 'Lecture 1 note 2.txt');
INSERT INTO ATTACHMENT (ID, CONTENT, LECTURE_ID, CONTENT_TYPE, FILENAME) VALUES ('4bd618c8-fe3e-43bc-b98c-65068b2342b5', 'Lecture 1 note 3 content', 1, 'text/plain', 'Lecture 1 note 3.txt');
INSERT INTO ATTACHMENT (ID, CONTENT, LECTURE_ID, CONTENT_TYPE, FILENAME) VALUES ('4c836270-4e68-4155-b82b-3d965e04003a', 'Lecture 1 note 4 content', 1, 'text/plain', 'Lecture 1 note 4.txt');


INSERT INTO REG_USER (FULL_NAME, PASSWORD, PHONE_NUMBER, ROLE, USERNAME) VALUES ('Teacher1', '{noop}1234', '12345678', 'ROLE_ADMIN', 't001');
INSERT INTO REG_USER (FULL_NAME, PASSWORD, ROLE, USERNAME) VALUES ('Student1', '{noop}1234', 'ROLE_USER', 's001');
INSERT INTO REG_USER (FULL_NAME, PASSWORD, ROLE, USERNAME) VALUES ('Student2', '{noop}1234', 'ROLE_USER', 's002');


INSERT INTO POLL (QUESTION) VALUES ('Which date do you prefer for the mid-term test?');
INSERT INTO POLL_OPTION (POLL_ID, IDX, TEXT) VALUES (1, 1, '21/5');
INSERT INTO POLL_OPTION (POLL_ID, IDX, TEXT) VALUES (1, 2, '22/5');
INSERT INTO POLL_OPTION (POLL_ID, IDX, TEXT) VALUES (1, 3, '24/5');
INSERT INTO POLL_OPTION (POLL_ID, IDX, TEXT) VALUES (1, 4, '26/5');

INSERT INTO POLL_RESPONSE (OPTION_ID, USER_ID) VALUES (1, 2);
INSERT INTO POLL_RESPONSE (OPTION_ID, USER_ID) VALUES (3, 3);

