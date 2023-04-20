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
/* Создайте таблицу city с колонками city_id и city_name. */

    CREATE TABLE city (
        city_id BIGSERIAL NOT NULL PRIMARY KEY,
        city_name VARCHAR(50) NOT NULL
    );

/* Добавьте в таблицу employee колонку city_id. */

    ALTER TABLE employee ADD COLUMN city_id INT;

/* Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city. */

    ALTER TABLE employee ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

/* Заполните таблицу city и назначьте работникам соответствующие города. */

    INSERT INTO city (city_name)
    VALUES ('Moscow'),
           ('Samara'),
           ('Sochi'),
           ('Kazan'),
           ('Saint Petersburg');

    UPDATE employee SET city_id = 1 WHERE id = 1;
    UPDATE employee SET city_id = 2 WHERE id = 3;
    UPDATE employee SET city_id = 3 WHERE id = 4;
    UPDATE employee SET city_id = 4 WHERE id = 5;
    UPDATE employee SET city_id = 5 WHERE id = 6;

/* Получите имена и фамилии сотрудников, а также города, в которых они проживают. */

    SELECT employee.first_name, employee.last_name, city.city_name FROM employee JOIN city ON employee.city_id = city.city_id;

/* Получите города, а также имена и фамилии сотрудников, которые в них проживают.
   Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
 */

    SELECT city.city_name, employee.first_name, employee.last_name FROM city LEFT JOIN employee ON employee.city_id = city.city_id;
/* Получите имена всех сотрудников и названия всех городов.
   Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
   Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.
 */

    SELECT employee.first_name, city.city_name FROM employee FULL JOIN city ON employee.city_id = city.city_id;

/* Получите таблицу, в которой каждому имени должен соответствовать каждый город. */

    SELECT employee.first_name, city.city_name FROM employee LEFT JOIN city ON employee.city_id = city.city_id;

/* Получите имена городов, в которых никто не живет. */

    SELECT city.city_name FROM employee RIGHT JOIN city ON employee.city_id = city.city_id WHERE employee.first_name IS NULL;



