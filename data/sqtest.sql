CREATE TABLE dept_emp (
   emp_no      INT             NOT NULL,
   dept_no     VARCHAR(4)         NOT NULL,
   from_date   DATE            NOT NULL,
   to_date     DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no),
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   PRIMARY KEY (emp_no,dept_no)
);


select * from employees1;

drop table employees;

alter table employees1 rename to employees;


CREATE TABLE employees (
   emp_no      INT             NOT NULL,
   birth_date  DATE            NOT NULL,
   first_name  VARCHAR(14)     NOT NULL,
   last_name   VARCHAR(16)     NOT NULL,
   gender      VARCHAR(1)         NOT NULL,
   hire_date   DATE            NOT NULL,
   PRIMARY KEY (emp_no)
);

select * from dept_emp;


CREATE TABLE dept_emp (
   emp_no      INT             NOT NULL,
   dept_no     VARCHAR(4)         NOT NULL,
   from_date   DATE            NOT NULL,
   to_date     DATE            NOT NULL,
   FOREIGN KEY (emp_no)  REFERENCES employees   (emp_no),
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
   PRIMARY KEY (emp_no,dept_no)
);

select * from titles;



--Once you have a complete database, do the following:


--List the following details of each employee: employee number, last name, first name, gender, and salary.
select * from employees;
select * from salaries;

SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;

--List employees who were hired in 1986.
--select * from employees where (hire_date) >='1986-01-01' AND (hire_date) < '1986-12-31' 
SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select * from dept_manager;
select * from employees;

SELECT employees.first_name, employees.last_name, employees.gender, dept_manager.emp_no, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN employees ON
employees.emp_no=dept_manager.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select * from dept_manager;
select * from departments;
select * from dept_emp;
select * from titles;
select * from employees;

SELECT employees.first_name, employees.last_name, employees.gender, dept_emp.dept_no, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name like 'Hercules' AND last_name like 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from dept_manager;
select * from departments;
select * from dept_emp;
select * from employees;

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON
departments.dept_no=dept_emp.dept_no
WHERE dept_name like 'Sales' OR dept_name like 'Development';


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "employees count"
FROM employees
GROUP BY last_name
ORDER BY "employees count" DESC;

--Bonus
from sqlalchemy import create_engine
engine = create_engine('postgresql://localhost:5432/<your_db_name>')
connection = engine.connect()
