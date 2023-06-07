use seminar5;

-- Создание и заполнение таблиц

create table if not exists Groupses(
	gr_id int auto_increment primary key,
    gr_name varchar(100) not null,
    gr_temp float
);

create table if not exists Analysis (
	an_id int auto_increment primary key,
    an_name varchar(100) not null,
    an_cost decimal (10,2),
    an_price decimal (10,2) check (an_price > 0),
    an_group int,
    foreign key (an_group) references Groupses(gr_id) on delete cascade   
);

create table if not exists Orders(
	ord_id int auto_increment primary key,
    ord_datetime timestamp,
    ord_an int,
    foreign key (ord_an) references Analysis(an_id) on delete cascade
);

insert into Groupses (gr_name, gr_temp) values
('Иммунологические', -18.5),
('Серологические', -15),
('Микробиологические', -1.5);

insert into Analysis (an_name, an_cost, an_price, an_group) values 
('Забор крови', 100.00, 330.00, 1),
('Фагоцитоз', 300.00, 600.00, 1),
('Кандидоз', 150.00, 450.00, 2),
('Столбняк', 550.00, 1125.00, 2),
('Анализ мокроты', 150.00, 400.00, 3),
('Дисбактериоз кишечника', 500.00, 1300.00, 3);

insert into Orders (ord_datetime, ord_an) values
('2020-01-31 09:00:00', 1),
('2020-02-05 10:00:00', 2),
('2020-02-06 13:30:00', 3),
('2020-02-07 15:30:00', 4),
('2020-02-09 12:00:00', 5),
('2020-02-10 11:30:00', 6),
('2020-02-12 14:30:00', 3),
('2020-02-13 12:30:00', 2),
('2020-02-14 11:00:00', 1);

/*
Вывести название и цену для всех анализов, 
которые продавались 5 февраля 2020 и всю следующую неделю.
*/

with date_ord as 
(select * from Orders 
where ord_datetime regexp '2020-02-([0][5-9]|[1][0-2])')
select an_name 'Название анализа', an_price 'Стоимость анализа', ord_datetime 'Дата проведения' 
from Analysis 
join date_ord 
on an_id = ord_an
order by ord_datetime;