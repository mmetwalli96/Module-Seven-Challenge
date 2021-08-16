-- ************* --
-- Deliverable 1 --
-- ************* --


-- Creating retirement_titles table. 
SELECT emp.emp_no, 
	emp.first_name, 
	emp.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date 
INTO retirement_titles FROM employees AS emp FULL JOIN titles AS ti ON emp.emp_no = ti.emp_no
WHERE emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31' ORDER BY (emp.emp_no);

-- Creating unique_titles table.
SELECT DISTINCT ON (emp_no) 
	emp_no, 
	first_name, 
	last_name, 
	title  
INTO unique_titles FROM retirement_titles ORDER BY emp_no, to_date DESC;

-- Creating retiring_titles table.
SELECT  COUNT(title), title INTO retiring_titles FROM unique_titles GROUP BY title ORDER BY COUNT(title) DESC;


-- ************* --
-- Deliverable 2 --
-- ************* --


-- Creating mentorship_eligibilty table. 
SELECT DISTINCT ON (emp.emp_no) emp.emp_no, 
	emp.first_name, 
	emp.last_name, 
	emp.birth_date,
	dept.from_date,
	dept.to_date,
	ti.title INTO mentorship_eligibilty
FROM employees AS emp FULL JOIN dept_emp AS dept ON emp.emp_no = dept.emp_no 
JOIN titles AS ti ON emp.emp_no = ti.emp_no
WHERE (dept.to_date = '9999-01-01') AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31') ORDER BY emp.emp_no;

