-- get employee number, first name and last name from employee table
select emp_no,
	   first_name,
	   last_name
from employees;

--get title, from date and to date from titles table
select title,
	   from_date,
	   to_date
from titles;
-- review birth date format
select birth_date from employees;

-- Retirement Title table creation
select e.emp_no,
	   e.first_name,
	   e.last_name,
	   t.title,
	   t.from_date,
	   t.to_date
	   into retirement_title
from employees as e
inner Join
titles as t 
On e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_title
ORDER BY emp_no, to_date DESC;

--retrieve the number of employees by their most recent job title who are about to retire.
select count(title), title
into retiring_titles
from unique_titles
group by title
order by count desc;

--Retrieve the emp_no, first_name, last_name, and birth_date from employee table 
Select emp_no,
	   first_name,
	   last_name,
	   birth_date
From employees;

--Retrieve the from_date and to_date columns from the Department Employee table.
Select from_date,
	   to_date
From dept_emp;

--Retrieve the title column from the Titles table
Select title 
from titles;

-- Select Distinct employee number for each set of rowss 
SELECT DISTINCT ON (e.emp_no) e.emp_no,
				    e.first_name,
					e.last_name,
					e.birth_date,
					de.from_date,
					de.to_date,
					t.title
Into mentorship_eligibilty
From employees as e
Inner Join 
dept_emp as de
On e.emp_no = de.emp_no
Inner Join
titles as t
On de.emp_no = t.emp_no
Where de.to_date =  '9999-01-01' And  (e.birth_date between '1965-01-01' And '1965-12-31')
order by e.emp_no;

