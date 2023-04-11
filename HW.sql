CREATE DATABASE skypro;
\c skypro

CREATE TABLE employee (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(6) NOT NULL,
    age INT NOT NULL
   );
    INSERT INTO employee (
    first_name, last_name, gender, age)
    VALUES ('John', 'Depp', 'male', 59);
    INSERT INTO employee (
    first_name, last_name, gender, age)
    VALUES ('Orlando', 'Bloom', 'male', 46);
    INSERT INTO employee (
    first_name, last_name, gender, age)
    VALUES ('Keira', 'Knightley', 'female', 38);
    SELECT * FROM employee;
    UPDATE employee SET first_name = 'Geoffrey' WHERE id = 3;
    UPDATE employee SET last_name = 'Rush' WHERE id = 3;
    UPDATE employee SET gender = 'male' WHERE id = 3;
    UPDATE employee SET age = 71 WHERE id = 3;
    SELECT * FROM employee;
    DELETE FROM employee WHERE id = 2;
    SELECT * FROM employee;