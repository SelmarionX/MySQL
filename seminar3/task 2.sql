create table if not exists employee (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(10) NOT NULL,
surname VARCHAR(10) NOT NULL,
specialty VARCHAR(10) NOT NULL,
seniority INT NOT NULL,
salary INT NOT NULL,
age INT NOT NULL
);

insert employee (name, surname, specialty, seniority, salary, age)
values 
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Каткина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 4, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'рабочий', 10, 10000, 49),
('Жорик', 'Иванов', 'уборщик', 4, 12000, 35);

-- ДОМАШНЕЕ ЗАДАНИЕ 
/* 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания*/
select * from employee order by salary;
select * from employee order by salary desc;

/* 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)*/
select * from (select * from employee order by salary desc limit 5) r order by r.salary;

/* 3. Выполните группировку всех сотрудников по специальности , 
суммарная зарплата которых превышает 100000 */
select sum(salary) sal, specialty s 
from employee
group by s
having sal > 100000;

