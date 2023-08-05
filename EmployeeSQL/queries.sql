-- emp_no, last_name, first_name, sex, salary
SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- first_name, last_name, hire_date **in 1986
SELECT
	first_name,
	hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';


-- manager of each department, dept_no, dept_name, emp_no, last_name, first_name
SELECT
	departments.dept_name,
	departments.dept_no,
	employees.first_name,
	employees.last_name,
	employees.emp_no
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


-- employee of each department, dept_no, dept_name, emp_no, last_name, first_name
SELECT
	departments.dept_name,
	departments.dept_no,
	employees.first_name,
	employees.last_name,
	employees.emp_no
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;


-- first_name, last_name, sex ** with first_name "Hercules" and last_name starting with "B"
SELECT
	first_name,
	last_name,
	sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';


-- emp_no in sales with last_name, first_name
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


-- emp_no in sales and develeopment with last_name, first_name
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = departments.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');


-- employees with the same last name
SELECT
	last_name,
	first_name,
	emp_no
FROM employees
WHERE last_name IN (
			SELECT last_name
			FROM employees
			GROUP BY last_name
			HAVING COUNT(*) > 1
			);



