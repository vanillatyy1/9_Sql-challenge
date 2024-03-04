-- Data Analysis

-- 1) List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no;
-- 300,024 results


-- 2) List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
-- 36,150 results


-- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)

SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name
FROM departments
LEFT JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees ON dept_manager.emp_no = employees.emp_no;
-- 24 results


-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)

SELECT dept_emp.dept_no, dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
ORDER BY dept_emp.dept_no ASC;
-- 331,603 results

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
-- 20 results

-- 6) List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';
-- 52,245 results

-- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name IN ('Sales','Development');
-- 137,952 results

-- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
-- 1,638 unique last names





















