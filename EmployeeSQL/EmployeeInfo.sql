-----CREATE TABLES 
CREATE TABLE titles (title_id VARCHAR   NOT NULL,
					  title VARCHAR   NOT NULL,
 					  PRIMARY KEY (title_id)
					  )

CREATE TABLE employees (emp_no INT   NOT NULL,
    					 emp_title_id VARCHAR NOT NULL,
    					 birth_date DATE   NOT NULL,
    					 first_name VARCHAR   NOT NULL,
    					 last_name VARCHAR   NOT NULL,
    					 sex VARCHAR   NOT NULL,
    					 hire_date DATE   NOT NULL,
    					 FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
   						 PRIMARY KEY (emp_no)
						)

CREATE TABLE departments (dept_no VARCHAR   NOT NULL,
    					   dept_name VARCHAR   NOT NULL,
    					   PRIMARY KEY (dept_no)
						  )

CREATE TABLE dept_manager (dept_no VARCHAR   NOT NULL,
    						emp_no INT   NOT NULL,
						    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
						    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
						    PRIMARY KEY (dept_no, emp_no)
							)

CREATE TABLE dept_emp (emp_no INT   NOT NULL,
					    dept_no VARCHAR   NOT NULL,
					    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
					    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
					    PRIMARY KEY (emp_no, dept_no)
						)

CREATE TABLE salaries (emp_no INT   NOT NULL,
					    salary INT   NOT NULL,
					    FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
						PRIMARY KEY (emp_no)
						)

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT a.emp_no, last_name, first_name, sex, salary 
FROM employees A
INNER JOIN salaries B
ON A.emp_no = B.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECt first_name, last_name, hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_name, b.dept_no, a.emp_no, last_name, first_name  
FROM employees A
INNER JOIN dept_manager B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT b.dept_no, a.emp_no, last_name, first_name, dept_name
FROM employees A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND  last_name ILIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT a.emp_no, last_name, first_name
FROM employees A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no
WHERE dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT a.emp_no, last_name, first_name, dept_name
FROM employees A
INNER JOIN dept_emp B
ON A.emp_no = B.emp_no
INNER JOIN departments C
ON B.dept_no = C.dept_no
WHERE dept_name IN ('Sales', 'Development')

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) "Shared Last Names" 
FROM employees 
GROUP BY last_name 
ORDER BY "Shared Last Names" DESC