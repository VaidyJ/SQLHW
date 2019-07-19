select * From employee;
select * From department;
select * From dept_manager;
select * From dept_emp;
select * From salaries;
select * From titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary from employee e join salaries s on
e.emp_no = s.emp_no;

--List employees who were hired in 1986.
select e.emp_no, e.last_name, e.first_name, e.gender, e.hire_date from employee e where 
extract(year from hire_date) = '1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, d_m.emp_no as "Mgr Emp Number", e.last_name as "Mgr Last Name", 
e.first_name as "Mgr First Name", d_m.from_date as "Dept Manager from", d_m.to_date 
as "Dept Manager till" from dept_manager d_m join employee e on e.emp_no = d_m.emp_no 
join  department d on d.dept_no = d_m.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name from employee e join dept_emp de 
on e.emp_no=de.emp_no join department d on d.dept_no=de.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

select * from employee e where e.first_name = 'Hercules' and upper(e.last_name) like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name from employee e join dept_emp de on 
e.emp_no=de.emp_no join department d on d.dept_no=de.dept_no
where upper(dept_name) = 'SALES';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name from employee e join dept_emp de on 
e.emp_no=de.emp_no join department d on d.dept_no=de.dept_no
where upper(dept_name) in ('SALES' , 'MARKETING');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name, count(*) from employee group by last_name order by count(*) desc;
