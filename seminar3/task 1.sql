use seminar3;

-- Создаем таблицы
create table if not exists salespeople (
	snum int primary key not null,
    sname varchar(100) not null,
    city varchar(100) not null,
    comm varchar(45)
);

create table if not exists customers (
	cnum int primary key not null,
    cname varchar(100) not null,
    city varchar(100) not null,
    rating int,
    snum int,
    foreign key(snum)
    references salespeople (snum)
);

create table if not exists orders (
	onum int primary key not null,
    amt decimal(8,2) check (amt > 0.00),
    odate date,
    cnum int,
    snum int,
    foreign key(cnum)
    references customers(cnum),
    foreign key(snum)
    references salespeople(snum)
);

-- Заполняем их данными
insert into salespeople(snum, sname, city, comm) values
(1001, 'Peel', 'London', '.12'),
(1002, 'Serres', 'San Jose', '.13'),
(1004, 'Motika', 'London', '.11'),
(1007, 'Rifkin', 'Barcelona', '.15'),
(1003, 'Axelrod', 'New York', '.10');

insert into customers(cnum, cname, city, rating, snum) values
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Rome', 200, 1003),
(2003, 'Liu', 'SanJose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'London', 100, 1001),
(2007, 'Pereira', 'Rome', 100, 1004);

insert into orders(onum, amt, odate, cnum, snum) values
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001, 1001),
(3002, 1900.10, '1990-03-10', 2007, 1004),
(3005, 5160.45, '1990-03-10', 2003, 1002),
(3006, 1098.16, '1990-03-10', 2008, 1007),
(3009, 1713.23, '1990-04-10', 2002, 1003),
(3007, 75.75, '2016-01-01', 2004, 1002),
(3008, 4723.00, '1990-04-10', 2006, 1001),
(3010, 1309.95, '2016-01-01', 2004, 1002),
(3011, 9891.88, '2016-01-01', 2006, 1001);

-- ДОМАШНЕЕ ЗАДАНИЕ СЕМИНАР 3
/* Напишите запрос, который вывел бы таблицу 
со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)*/
select city, sname, snum, comm from salespeople;
/*2. Напишите команду SELECT, которая вывела бы оценку(rating), 
сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
*/
select cname 'Имя', rating 'Рейтинг', city from customers where city = 'SanJose';

/*3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
*/
select distinct snum from salespeople;

/*4*. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. */
select * from customers where cname like 'G%';

/*5. Напишите запрос, который может дать вам все заказы 
со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
*/
select * from orders where amt > 1000.00;

/* 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
*/
select min(amt) min_order from orders;

/*7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, 
у которых рейтинг больше 100 и они находятся не в Риме.
*/
select * from customers where rating > 100 and city != 'Rome';


