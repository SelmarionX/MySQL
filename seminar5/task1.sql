use seminar5;


-- Таблица автомобилей
create table if not exists auto (
	id_auto int auto_increment primary key,
    name varchar(50) not null,
    cost decimal (10, 2) check (cost > 0)
);

insert into auto (name, cost) values
('Audi', 52642.00),
('Mersedes', 57127.00),
('Skoda', 9000.00),
('Volvo', 29000.00),
('Bently', 350000.00),
('Citroen', 21000.00),
('Hummer', 41400.00),
('Volkswagen', 21600.00);

select * from auto;
-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
create or replace view car_cost as 
(select * from auto where cost < 25000.00);
-- вывод
select * from car_cost;

-- 2.	Изменить в существующем представлении порог для стоимости: 
--      пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
alter view car_cost as 
(select * from auto where cost < 30000.00);
-- вывод
select * from car_cost;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
create or replace view car_model as 
(select * from auto where name in ('Skoda', 'Audi'));

-- вывод
select * from car_model;