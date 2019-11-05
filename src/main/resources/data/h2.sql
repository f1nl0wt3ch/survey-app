-- 1. create table answer for testing
CREATE SCHEMA IF NOT EXISTS testdb;
DROP TABLE IF EXISTS ibiza_answer;
 
CREATE TABLE ibiza_answer (answer_id INT AUTO_INCREMENT  PRIMARY KEY, answer TEXT NOT NULL);
-- insert testing data
INSERT INTO ibiza_answer (answer) VALUES ('Kyllä'), ('Ei'), ('Ei koske minua');

SELECT * FROM answer;

-- 2. create table ibiza_question_type
DROP TABLE IF EXISTS ibiza_question_type;
 
CREATE TABLE ibiza_question_type (question_type_id INT AUTO_INCREMENT PRIMARY KEY, type TEXT NOT NULL);
 
INSERT INTO ibiza_question_type (type) VALUES ('Monivalintakysymys'), ('Suosittelukysymys'), ('Avoin kysymys');

SELECT * FROM ibiza_question_type;

-- 3. create table user
DROP TABLE IF EXISTS ibiza_user;

CREATE TABLE ibiza_user (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  username text,
  password text,
  email text
);

INSERT INTO ibiza_user (username) VALUES ('user1'), ('user2'), ('user3');

-- 4. create table ibiza_questionary

DROP TABLE IF EXISTS ibiza_questionary;
CREATE TABLE ibiza_questionary (
questionary_id INT AUTO_INCREMENT  PRIMARY KEY, 
name TEXT NOT NULL, 
fk_user_id INT,
created_date timestamp DEFAULT CURRENT_TIMESTAMP(),
FOREIGN KEY (fk_user_id) REFERENCES ibiza_user (user_id),
);

INSERT INTO ibiza_questionary (name, fk_user_id) VALUES ('Kysely 1', 1), ('Kysely 2', 2), ('Kysely 3', 3);


-- 5. create table ibiza_question 
DROP TABLE IF EXISTS ibiza_question;
CREATE TABLE ibiza_question (
  question_id INT AUTO_INCREMENT  PRIMARY KEY,
  question TEXT NOT NULL,
  fk_question_type_id INT,
  fk_questionary_id INT,
  FOREIGN KEY (fk_question_type_id) REFERENCES ibiza_question_type (question_type_id),
  FOREIGN KEY (fk_questionary_id) REFERENCES ibiza_questionary (questionary_id)
);
 
INSERT INTO ibiza_answer (answer) VALUES ('Kyllä'), ('Ei'), ('Ei koske minua');
INSERT INTO ibiza_user (username) VALUES ('user1'), ('user2'), ('user3');
INSERT INTO ibiza_question_type (type) VALUES ('Avoin palaute'), ('Suosittelukysymys'), ('Monivalintakysymys');
INSERT INTO ibiza_questionary(name, fk_user_id) VALUES ('Kysely 1',1), ('Kysely 2',2), ('Kysely 3',3);
INSERT INTO ibiza_question (question, fk_questionary_id, fk_question_type_id) VALUES ('Question 1', 1,1), ('Question 2', 1, 2), ('Question 3',1, 3);
INSERT INTO ibiza_question (question, fk_questionary_id, fk_question_type_id) VALUES ('Question 23',2, 2), ('Question 24', 2, 1), ('Question 25',2, 3);
INSERT INTO ibiza_question (question, fk_questionary_id, fk_question_type_id) VALUES ('Question 31', 3, 3), ('Question 32', 3, 2), ('Question 33',3, 1);
