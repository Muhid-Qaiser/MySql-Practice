-- use northwind;


-- lab 12

-- Delimiter $$
-- create Trigger nigger

-- 	BEFORE Insert
--     on products
--     for each row
--     
-- begin

-- 	if new.UnitPrice < 100 then
-- 		set new.UnitPrice = 555;
-- 	end if;

-- end $$
-- delimiter ;


-- insert into products (productname, supplierID,  CategoryID, Quantityperunit, unitprice, unitsinstock, unitsonorder, reorderlevel, discontinued )
-- 		values ('glue', 1, 1,'1', 1,1, 1, 1,1);


-- drop TRIGGER nigger;

-- delete p
-- from products p
-- where p.productname = 'glue';


-- lab 11

-- delimiter $$
-- create procedure q1(IN id INT, Out countods INT)
-- begin

-- 		select * from employees e
-- 		join orders o
-- 			on e.employeeid = o.employeeid
-- 		where e.employeeid = id;
--         
--         select count(*) into countods from employees e
-- 		join orders o
-- 			on e.employeeid = o.employeeid
-- 		where e.employeeid = id;
--         
-- end $$
-- delimiter ;

-- set @id = 2;

-- call q1(@id, @outs);

-- -- select @outs;

-- drop procedure q1;


-- Delimiter $$
-- create function q2 (id INT)
-- returns decimal(10, 2)
-- deterministic
-- begin
-- 	declare rev decimal(10, 2) default 0.00;

-- 	select sum( unitprice * quantity ) into rev from `order details` od
-- 	group by od.orderid
-- 	having od.orderid = id;
--     
--     return rev;
--     
-- end $$
-- delimiter ;

-- select q2(10248) as rev;

-- drop function q2;


-- Delimiter $$
-- create function q3 (num INT)
-- returns INT
-- DETERMINISTIC

-- begin

-- 	declare sq int default 0;
--     
--     set sq = num * num;
--     
--     return sq;

-- end $$
-- Delimiter ;

-- select q3(3);

-- drop function q3;



-- Delimiter $$
-- create procedure q4 (in start1 int, in end1 int, out res varchar(1000)  )
-- begin

-- 	declare temp varchar(10) default '';
--     set res = '';

-- 	while start1 <= end1 do
-- 		
-- 		select q3 ( start1 ) into temp;
--         
--         set res = concat(res, temp, ', ');
-- 		
-- 		set start1 = start1 + 1;
-- 		
--     end while;

-- end $$
-- delimiter ;

-- call q4(0, 10, @ans);

-- select @ans;

-- drop procedure q4;
-- drop procedure q3;


-- delimiter $$
-- create procedure pp (inout id int, in inc int)
-- begin 

-- 	set id = id + inc;

-- end $$
-- delimiter ;

-- set @id = 1;

-- call pp(@id, 1);
-- call pp(@id, 1);
-- call pp(@id, 5);

-- select @id;

-- drop procedure pp;

-- delimiter $$
-- create function cc (credit int)
-- RETURNS varchar(100)
-- deterministic
-- begin
-- 	declare stat varchar(100) default '';

-- 	if credit > 7 then
-- 		set stat = 'Plat';
--     
--     elseif credit > 5 then
-- 		set stat = 'Gold';
--     
--     elseif credit > 2 then 
-- 		set stat = 'Silv';
-- 	
--     ELSE
-- 		set stat = 'Bronz';
--     
--     end if;

-- 	return stat;
-- 	
-- end $$
-- delimiter ;

-- select cc(1);

-- show function STATUS;

-- drop function cc;




-- Lab 07

-- create database lab7;

use lab7;

-- create table products (
-- 	
--     pid int not null auto_increment primary key,
--     name varchar(100),
--     category enum('food', 'bills', 'fun')
-- );

-- insert into products  (name, category)	values
-- 	('lassi', 'food'),
--     (2, 'water bills', 'bills'),
--     (3, 'games', 'fun');


-- create table Suppliers (
-- 	
--     sid int not null auto_increment primary key,
--     name varchar(100)
-- );

-- insert into suppliers (name) values
-- 		("Ali"),
-- 		("Joe"),
--         ("Ligma"),
--         ("Khan");


-- create table Supplied (
-- 	
--     sid int not null,
--     pid int not null,
--     quantity int,
--     sup_date date,
--     time_dil time,
--     year_dil year,
--     
--     PRIMARY KEY(sid, pid),
--     constraint sid_fk Foreign Key (sid) References Suppliers (sid) , 
--     constraint pid_fk Foreign Key (pid) References Products (pid) 
--     
-- );

-- drop table supplied;

-- insert into supplied (sid, pid, quantity, sup_date, time_dil, year_dil) values
-- 		(1, 1, 3, '2022-03-11', '12:00:00', 2022),
-- 		(2, 2, 3, '2024-01-11', '13:30:00', 2012),
--         (1, 3, 3, '2024-04-11', '12:00:30', 2026),
--         (1, 4, 3, '2024-03-15', '9:00:30', 2029);



-- select * from supplied sd
-- join suppliers sr
-- 	on sr.sid = sd.sid
-- join products p
-- 	on p.pid = sd.pid
-- where sup_date < (date(sysdate()))
-- and year_dil <= year( sysdate() )
-- and time_dil > time(sysdate());


















