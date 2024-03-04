-- Adjusts the datestyle settings for the entire database
-- documentation: https://www.postgresql.org/docs/current/datatype-datetime.html
ALTER DATABASE "Module_9a" SET datestyle TO 'ISO, MDY';

CREATE TABLE departments (
    Dept_no VARCHAR(4) PRIMARY KEY,
    Dept_name VARCHAR(20)
);

CREATE TABLE titles (
    Title_id VARCHAR(5) PRIMARY KEY,
    Title VARCHAR(255)
);

CREATE TABLE employees (
    Emp_no INTEGER PRIMARY KEY,
    Emp_title_id VARCHAR(5),
    Birth_date DATE,
    First_name VARCHAR(255),
    Last_name VARCHAR(255),
    Sex VARCHAR(2),
    Hire_date DATE,
    FOREIGN KEY (Emp_title_id) REFERENCES titles(Title_id)
);

CREATE TABLE dept_emp (
    Emp_no INTEGER,
    Dept_no VARCHAR(4),
    FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no),
    FOREIGN KEY (Dept_no) REFERENCES departments(Dept_no),
    PRIMARY KEY (Emp_no, Dept_no)
);

CREATE TABLE dept_manager (
	Dept_no VARCHAR(4),
    Emp_no INTEGER,
    FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no),
    FOREIGN KEY (Dept_no) REFERENCES departments(Dept_no),
    PRIMARY KEY (Emp_no, Dept_no)
);

CREATE TABLE salaries (
    Emp_no INTEGER,
    Salary INTEGER,
    FOREIGN KEY (Emp_no) REFERENCES employees(Emp_no)
);



