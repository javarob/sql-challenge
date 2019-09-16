-- Question 1
-- List the following details of each employee: employee number, 
-- last name, first name, gender, and salary.

select emp.emp_no, emp.first_name, emp.last_name, emp.gender, sal.salary
from employees as emp
join salaries as sal
     on emp.emp_no = sal.emp_no;
	 
-- Question 2
-- List employees who were hired in 1986.

select first_name,last_name,hire_date from employees 
where cast(hire_date as varchar) like '1986%';

-- Question 3
-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.

select dm.dept_no, dp.dept_name, dm.emp_no, emp.last_name, emp.first_name, dm.from_date, dm.to_date
from dept_manager as dm
join employees as emp on dm.emp_no = emp.emp_no
join departments as dp on dm.dept_no = dp.dept_no;

-- Question 4
-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
-- Should this be limited to most current dept????

select de.dept_no, de.emp_no, emp.last_name, emp.first_name, dp.dept_name
from dept_emp as de
join departments as dp on de.dept_no = dp.dept_no
join employees as emp on de.emp_no = emp.emp_no;

-- Question 5
-- List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name from employees where first_name = 'Hercules'
and last_name like 'B%';

-- Question 6
-- List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
from employees as emp
join dept_emp as de on emp.emp_no = de.emp_no
join departments as dp on de.dept_no = dp.dept_no
where dp.dept_name = 'Sales';

-- Question 7
-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
-- Currently in sales/development or ever in those????

select emp.emp_no, emp.last_name, emp.first_name, dp.dept_name
from employees as emp 
join dept_emp as de on emp.emp_no = de.emp_no
join departments as dp on de.dept_no = dp.dept_no
where dp.dept_name = 'Sales' or dp.dept_name = 'Development';

-- Question 7
-- In descending order, list the frequency count of employee 
-- last names, i.e., how many employees share each last name.

select count(*) as "Count of Names", last_name from employees
group by last_name
order by "Count of Names" desc
