use seminar4;

-- Создание таблицы машин
CREATE TABLE  AUTO 
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

-- Заполнение данными
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM ) VALUES
(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221'),
(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334'),
(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334'),
(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332'),
(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336'),
(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444'),
(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null),
(111117,'BMW', 'СИНИЙ', date'2005-01-01', null),
(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

SELECT * FROM seminar4.auto;
/* Задание 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA*/
select mark 'Произодитель', color 'Цвет', count(*) 'Остаток' 
from auto 
where mark in ('BMW','LADA')
group by color, mark
order by mark, color;

/*2. Вывести на экран марку авто и количество AUTO не этой марки*/
select 
	mark 'Производитель', 
	count(*) 'Количество машин произодителя', 
    (select sum(a.total) 
		from (select mark, count(*) total 
				from auto 
                group by mark 
                having mark != a_all.mark) a) 'Остаток машин других производителей'
from auto a_all group by mark;

