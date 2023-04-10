CREATE DATABASE skypro;
CREATE DATABASE
\c skypro

CREATE TABLE employee (
    skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
        skypro(# first_name VARCHAR(50) NOT NULL,
        skypro(# last_name VARCHAR(50) NOT NULL,
        skypro(# gender VARCHAR(6) NOT NULL,
        skypro(# age INT NOT NULL
        skypro(# );
CREATE TABLE
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES ('John', 'Depp', 'male', 59);
    INSERT 0 1
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES ('Orlando', 'Bloom', 'male', 46);
    INSERT 0 1
    skypro=# INSERT INTO employee (
                                      skypro(# first_name, last_name, gender, age)
    skypro-# VALUES ('Keira', 'Knightley', 'female', 38);
    INSERT 0 1
    skypro=# SELECT * FROM employee;
    skypro=# UPDATE employee SET first_name = 'Geoffrey' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employee SET last_name = 'Rush' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employee SET gender = 'male' WHERE id = 3;
    UPDATE 1
    skypro=# UPDATE employee SET age = 71 WHERE id = 3;
    UPDATE 1
    skypro=# SELECT * FROM employee;

    skypro=# DELETE FROM employee WHERE id = 2;
    DELETE 1
    skypro=# SELECT * FROM employee;