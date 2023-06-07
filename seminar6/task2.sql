# Задача 2
-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

delimiter //
create function even_numbers ()
returns varchar(100)
deterministic
begin
declare i int default 1;
declare result varchar(100) default "";
	while i <= 10 do
		if (i % 2 = 0) then
			set result = concat(result, " ", i);
			set i = i + 2;
		else
			set i = i + 1;
        end if;
	end while;
return result;
end //
delimiter ;

-- проверка
select even_numbers();