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

/*  Доведите количество записей в таблице до 5.*/
    INSERT INTO employee (
    first_name, last_name, gender, age)
    VALUES ('Robert', 'Downey', 'male', 58);
    INSERT INTO employee (
    first_name, last_name, gender, age)
    VALUES ('Chris', 'Evans', 'male', 41);
    INSERT INTO employee (
    first_name, last_name, gender, age)
    VALUES ('Mark', 'Ruffalo', 'male', 55);
    SELECT * FROM employee;

/*  Получите информацию об именах и фамилиях по всем сотрудникам.
    Колонки должны называться «Имя» и «Фамилия».
*/
    SELECT first_name AS Имя, last_name AS Фамилия FROM employee;

/* Получите всю информацию о сотрудниках,
   которые младше 30 или старше 50 лет.
*/

    SELECT * FROM employee WHERE age < 30 OR age > 50;

/* Получите всю информацию о сотрудниках,
   которым от 30 до 50 лет.
*/
    SELECT * FROM employee WHERE age BETWEEN 30 AND 50;

/* Выведите полный список сотрудников,
   которые отсортированы по фамилиям в обратном порядке.
*/

    SELECT * FROM employee ORDER BY last_name DESC;

/* Выведите сотрудников, имена которых длиннее 4 символов.*/

    SELECT * FROM employee WHERE length(first_name) > 4;

/* Измените имена у двух сотрудников так,
   чтобы на 5 сотрудников было только 3 разных имени,
   то есть чтобы получились две пары тезок и один сотрудник с уникальным именем.
 */

    UPDATE employee SET first_name = 'Mark' WHERE id = 1;
    UPDATE employee SET first_name = 'Chris' WHERE id = 3;

/* Посчитайте суммарный возраст для каждого имени.
   Выведите в двух столбцах «имя» и «суммарный возраст».
 */

    SELECT first_name AS Имя, sum(age) AS СуммарныйВозраст FROM employee GROUP BY Имя;

/* Выведите имя и самый юный возраст, соответствующий имени.*/

    SELECT first_name, age FROM employee WHERE age = (SELECT min(age) FROM employee);

/* Выведите имя и максимальный возраст только для неуникальных имен.
   Результат отсортируйте по возрасту в порядке возрастания.
 */

    SELECT first_name AS Имя, max(age) AS МаксимальныйВозраст FROM employee GROUP BY first_name HAVING count(first_name) > 1;