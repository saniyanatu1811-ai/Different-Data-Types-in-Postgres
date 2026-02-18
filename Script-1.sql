create database de_learning_test

create schema d_gds;

CREATE TABLE IF NOT EXISTS d_gds.employees (
    emp_id INT,
    emp_name VARCHAR(100),
    emp_sal NUMERIC(12,2),
    hiring_date DATE
);
insert into d_gds.employees values(1, 'Shashank', 1000,'2025-09-15');
insert into d_gds.employees(emp_sal,emp_name, emp_id)
values(2000, 'rahul', 2);
select* from d_gds.employees;
insert into d_gds.employees values(3, 'Saniya', 2000,'2025-08-16'),
(4,'rutuja', 1500, '2025-09-23'),(5,'khushee',500, '2026-01-01');
select* from d_gds.employees;

select 
    emp_name,
    emp_sal
    from d_gds.employees;

select
emp_sal as salary
from d_gds.employees;

-- select employee data and display old salary and new salary
-- where new salary is basically 20% incremented salary
select
    emp_id,
    emp_name,
    emp_sal as old_emp_sal,
    (emp_sal*1.2) as new_emp_sal
from d_gds.employees;

SELECT 
    *,
    emp_sal * 1.2 AS updated_salary
FROM d_gds.employees;

select * from d_gds.employees limit 2;

-- update the salary of employee after giving 20% increment
update d_gds.employees set emp_sal = emp_sal * 1.2;
select * from d_gds.employees;
--update command  for multiple columns at once 
--new salary will be incremented salary
-- name of employees should be in the capital letters 
update  d_gds.employees
set emp_sal = emp_sal * 1.2 , emp_name = upper(emp_name);
select * from d_gds.employees
 
INSERT INTO d_gds.employees VALUES
(6, 'Rohit', 4500, '2025-09-16'),
(7, 'Sneha', 5200, '2025-06-20'),
(8, 'Siyanat', 6000, '2025-06-22'),
(9, 'Anas', 3800, '2025-11-22'),
(10, 'Anjali', 4200, '2025-08-05');



-- get employee  records who joined company on 2025-08-05
--where clause

select * from d_gds.employees where hiring_date = '2025-08-05';

--update employee salaries to exact 10000
--who joined  the company on '2025-08-05'

update d_gds.employees set emp_sal = 10000
where hiring_date = '2025-08-05';

select * from d_gds.employees;

delete from d_gds.employees where hiring_date = '2025-08-05';
select * from d_gds.employees;
rollback;

--create new user 
create user de_intern with password 'deintern123';


grant usage on schema d_gds to de_intern;

grant select on table d_gds.employees to de_intern;

revoke select on table d_gds.employees from de_intern;

CREATE TABLE d_gds.salary_data (
    emp_id INT,
    emp_name VARCHAR(50),
    emp_sal INT
);

insert into d_gds.salary_data values
(1, 'Amit', 5000),
(2, 'Nitin', 3500),
(3, 'Kajal', 4000);

emp_sal = 10000

	
begin
    update1 - emp_sal = 12000
	update2 - emp_sal = 14000
	update3 - emp_sal = 16000
    update4 - emp_sal = 20000
rollback will take you to emp_sal = 10000;
rollback will to complete rollback of a transaction 
    
savepoint does the partial rollback inside a transaction 
    
emp_sal = 10000
begin;
	update1 - emp_sal = 12000
	update2 - emp_sal = 14000
	savepoint till_update2
    update3 - emp_sal = 16000
    update4 - emp_sal = 20000
rollback to savepoint till_update2


select * from d_gds.salary_data;
begin;
insert into d_gds.salary_data values (10,'Rohit', 6000);
insert into d_gds.salary_data values (11,'Ankit', 7000);
savepoint sp_till_ankit;

insert into d_gds.salary_data values (12, 'Ramesh', -8000);
rollback to savepoint sp_till_ankit;

-> integrity constraints 
1.) not null 
2.) unique 
3.) check   
4.) default   
5.) primary key
6.) foreign key 

create table if not exists d_gds.employee_with_constraints
(
   id INT,
   name VARCHAR(50) not null,
   salary INT,
   hiring_date DATE default '2025-01-01',
   unique (id),
   check (salary > 1000) 
);

insert into d_gds.employee_with_constraints
values(1, 'Shashank', 3000, '2025-11-20');

select * from d_gds.employee_with_constraints;

insert into d_gds.employee_with_constraints
values(null, 'Rahul', 5000, '2025-10-23');

insert into d_gds.employee_with_constraints
values(null, 'Rajat', 2000, '2020-09-20');


CREATE TABLE IF NOT EXISTS d_gds.employee_with_constraints_tmp (
    id INT,
    name VARCHAR(50) NOT NULL,
    salary NUMERIC(10,2),
    hiring_date DATE DEFAULT DATE '2021-01-01',
    CONSTRAINT unique_emp_id UNIQUE (id),
    CONSTRAINT salary_check CHECK (salary > 1000)
);
-- add a new column in existing table 
alter table d_gds.employee_with_constraints_tmp add DOB date;
SELECT * 
FROM d_gds.employee_with_constraints_tmp;

--change the data type pf existing column
ALTER TABLE d_gds.employee_with_constraints_tmp
ALTER COLUMN name TYPE VARCHAR(100);

--deleting exoisting column from the table 
alter table d_gds.employee_with_constraints_tmp drop column DOB;

--RENAME ANY EXISTING COLUMN 
alter table d_gds.employee_with_constraints_tmp rename column name to emp_name;

--add integrity constarint in existing table 

alter table d_gds.employee_with_constraints_tmp add constraint unique_emp_id UNIQUE (id);

--drop integrity constraint in existing table 

alter table d_gds.employee_with_constraints_tmp drop constraint unique_emp_id unique (id);

create table d_gds.guests
(
id int,
 name varchar (50),
 age int,
 constraint g_pk primary key (id)
 );
insert into d_gds.guests values(1, 'Shashank', 29);


customer (cust_id, name, address)
123
orders (order_id, order_item, amount, date, status, cust_id) 123







