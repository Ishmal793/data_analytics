-- select statement ******************************* 
SELECT * 
FROM  parks_and_recreation.employee_demographics;

SELECT first_name
FROM  parks_and_recreation.employee_demographics;

SELECT first_name,last_name,birth_date
FROM  parks_and_recreation.employee_demographics;

SELECT first_name,
last_name,
birth_date,
age,
age + 10
FROM  parks_and_recreation.employee_demographics;
# PAMDAS
SELECT first_name,
age,
(age + 10)*10 
FROM  parks_and_recreation.employee_demographics;

-- find unique values  in table  
SELECT DISTINCT gender,
first_name,age
FROM parks_and_recreation.employee_demographics;
-- where clause ***********************************************
select *
from parks_and_recreation.employee_demographics
where gender='Male';
 
 select *
 from parks_and_recreation.employee_salary
 where salary>50000;
 
 select *
 from parks_and_recreation.employee_salary
 where salary>=50000;
 
  select *
 from parks_and_recreation.employee_salary
 where salary=50000;
 
 select* 
 from employee_demographics
 where gender!='Male';
 
 select* 
 from employee_demographics
 where birth_date > '1985-01-01';
 
-- logical operators  *************************************
-- AND OR NOT 
 select* 
 from employee_demographics
 where birth_date > '1985-01-01' 
 AND  gender='Male' 
 ;
 
 select* 
 from employee_demographics
 where birth_date > '1985-01-01' 
  OR  NOT gender='Male' 
 ;
  
   select* 
 from employee_demographics
 where (first_name ='Leslie' AND age=44) OR age >55
 ;
-- Like Statement *************************************8
-- we can use % and _ in like statement\
-- agr ma = use kar ka name do ji to jerr to match nai kara ha agar ma like likha kar jerr match karo gi to muja us sa related day ga na 
 -- % mean anything and _ mean specific value   for a charcter value 
select* 
 from employee_demographics
 where first_name like 'a___%'
 ;
 
    select* 
 from employee_demographics
 where birth_date like '1987%'
 ;
 
 -- group by ***************************************
 -- group by use *having* instant of where 
 select gender
 from employee_demographics
 group by gender
 ;
 
 select gender,avg(age),max(age),min(age),count(age)
 from employee_demographics
 group by gender
 ;
 select occupation,avg(salary),max(salary)
 from employee_salary
 group by occupation
 ;
 
  select occupation,salary
 from employee_salary
 group by occupation,salary
 ;
   select occupation,salary
 from employee_salary
 group by occupation,salary having  salary>50000
 ;
 -- Order by  ************************
 select*
 from employee_demographics
 order by first_name;
 
  select*
 from employee_demographics
 order by first_name desc; 
 
 select*
 from employee_demographics
 order by gender ,age desc; 
 -- we can also use position of the colum instand of its name 
 select*
 from employee_demographics
 order by 5 ,4 desc; 
 -- limit cluse   ******************************
 -- top 3 values .. mid values etc
 
 select *
 from employee_demographics order by age limit 3; --  for first three values 
 select *
 from employee_demographics order by age limit 2,3;
 
 
-- between operator ********************************


select*
from employee_demographics where age between 25 and 60;

-- in and not in orders ************************************
select*
from employee_demographics where age in (44,40);
SELECT * FROM mydatabase.orders where region in ("West","East");
SELECT * FROM mydatabase.orders where region not  in ("West","East");
SELECT * FROM mydatabase.orders where region not  in ("West","East") and subcategory in ("Laptops",'Belts');
-- concatination  *************************************

select concat(first_name,"  ", gender) as concatination_data FROM  parks_and_recreation.employee_demographics;

select concat_ws( " , ",first_name,last_name, gender) as concatination_data FROM  parks_and_recreation.employee_demographics;
select length(last_name) from  parks_and_recreation.employee_demographics;
select upper(first_name) as Names from  parks_and_recreation.employee_demographics;
select lower(first_name) as Names from  parks_and_recreation.employee_demographics;
select left(first_name,4) as Names from  parks_and_recreation.employee_demographics;
select right(first_name,4) as Names from  parks_and_recreation.employee_demographics;
select mid(first_name,2,4) as Names from  parks_and_recreation.employee_demographics;

--  Data aggregation numeric function *******************************
select *from  parks_and_recreation.employee_demographics;
select sum(age) from parks_and_recreation.employee_demographics;
select max(age) from parks_and_recreation.employee_demographics;
select truncate(age,1) from parks_and_recreation.employee_demographics;  -- for decimal value after points gives only 1 value after a point 
select  ceil(profit)FROM mydatabase.orders;  -- to remove decimal value   and also make <= then .5 value  grater by adiing 1 
select  floor(profit)FROM mydatabase.orders; 

-- date functios use  ***********************************
SELECT date(birth_date) as dates FROM parks_and_recreation.employee_demographics;
SELECT datediff(ship_date,order_date) FROM ordersdb.orders;
SELECT dayname(ship_date) FROM ordersdb.orders;

SELECT monthname(ship_date) FROM ordersdb.orders;
SELECT year(ship_date) FROM ordersdb.orders;
-- case operator  ****************************************

SELECT product_name,quantity ,
case
	when quantity<=1 then "lower order "
	when quantity>=4 then "high  order "
    else "avg order"
end as prduction_detail
FROM ordersdb.orders;
-- join  *****************************************
--  inner join 
select products.productName,orderdetails.quantityOrdered from products 
inner join orderdetails  on products.productCode =orderdetails.productCode;
select products.productName,sum(orderdetails.quantityOrdered )from products 
inner join orderdetails  on products.productCode =orderdetails.productCode
group by products.productName;
-- left join 
 select products.productName,orderdetails.quantityOrdered from products 
left join orderdetails  on products.productCode =orderdetails.productCode;
-- cross join 
select products.productName,orderdetails.quantityOrdered from products 
cross join orderdetails  on products.productCode =orderdetails.productCode;
 
 -- set operations *******************
 SELECT employee_id,first_name FROM parks_and_recreation.employee_demographics
 union
 SELECT employee_id,first_name FROM parks_and_recreation.employee_salary;

-- unoin all for repeating value

--  for intercept we use in  
 SELECT employee_id,first_name FROM parks_and_recreation.employee_demographics
 where employee_id  in (select employee_id from parks_and_recreation.employee_salary);

--  for using expect we use not in 
 SELECT employee_id,first_name FROM parks_and_recreation.employee_demographics
 where employee_id  not in (select employee_id from parks_and_recreation.employee_salary);
 -- sub qurey in sql *********************** 
 SELECT * FROM classicmodels.customers where creditLimit >(select avg(creditLimit) from classicmodels.customers);
-- view 
create view count_of_customers as
 SELECT country,count(customerName) FROM classicmodels.customers
 group by country;

-- stored functions 
delimiter &&
create procedure  get_costomer_data()
begin 
	select *from classicmodels.customers;
    end &&
delimiter ;
-- limit  
delimiter &&
create procedure  get_costomer_data_limit( in var int)
begin 
	select *from classicmodels.customers limit var;
    end &&
delimiter ;

-- out  

delimiter &&
create procedure  get_costomer_data_credit( out var int )
begin 
	select max(creditLimit) into var from classicmodels.customers ;
    end &&
delimiter 
call get_costomer_data();
call classicmodels.get_costomer_data_limit(3);
call classicmodels.get_costomer_data_credit(@var);
select @var;






