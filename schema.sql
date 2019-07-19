create table employee
(
emp_no	integer primary key,
birth_date date,	
first_name varchar(100),	 
last_name varchar(100),	
gender	varchar(1),
hire_date date
);

create table department
(
dept_no	varchar(4) primary key,
dept_name varchar(50)
);

Create table dept_manager
(
dept_no	varchar(4) references department(dept_no),
emp_no	integer references employee(emp_no),
from_date date,
to_date date
);

Create table dept_emp(
emp_no	integer references employee(emp_no),
dept_no	varchar(4) references department(dept_no),
from_date date,
to_date date
);

create table salaries
(
emp_no		integer references employee(emp_no),
salary	integer,
from_date date,	
to_date date
);

create table titles
(
emp_no	integer references employee(emp_no),
title	varchar(100),
from_date date,	
to_date date
);